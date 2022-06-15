//
//  AccelerometerView.swift
//  ChartExplorer
//
//  Created by Gavi Narra on 6/14/22.
//

import SwiftUI
import Charts
import CoreMotion

struct AccelerometerView:View{
    let motion = CMMotionManager()
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State var x:Double = 0
    @State var y:Double = 0
    @State var z:Double = 0
    @State var chartData:[(dt:Date,x:Double,y:Double,z:Double)]=[]

    var body: some View{
        VStack{
            Text("Data: \(x),\(y),\(z)").onReceive(timer){ input in
                if let data = self.motion.accelerometerData {
                    x = data.acceleration.x
                    y = data.acceleration.y
                    z = data.acceleration.z
                    chartData.append((Date(),x,y,z))
                    if(chartData.count > 50){
                        chartData.removeFirst()
                    }

                }
            }
            Text("X").bold().padding()
            Chart(chartData,id:\.self.0){ item in
                LineMark(x:.value("Dt", item.dt ),y: .value("x", item.x))
               
            }
            Text("Y").bold().padding()
            Chart(chartData,id:\.self.0){ item in
                LineMark(x:.value("Dt", item.dt ),y: .value("y", item.y))
               
            }
            Text("Z").bold().padding()
            Chart(chartData,id:\.self.0){ item in
                LineMark(x:.value("Dt", item.dt ),y: .value("z", item.z))
               
            }
            
        }
        
    }
    
    init(){
        if self.motion.isAccelerometerAvailable {
            self.motion.accelerometerUpdateInterval = 1.0 / 60.0  // 60 Hz
            self.motion.startAccelerometerUpdates()
        }
    }
    
   
}

struct AccelerometerView_Previews:PreviewProvider{
    static var previews: some View{
        AccelerometerView()
    }
}
