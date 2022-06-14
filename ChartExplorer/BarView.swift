//
//  BarView.swift
//  ChartExplorer
//
//  Created by Gavi Narra on 6/11/22.
//

import SwiftUI
import Charts

struct BarView:View{
    @State var data:[(String, Int)]
    init(){
        data = [("New York",900),("Pittsburgh",600), ("Chicago",1200)]
    }
    var body: some View{
                ScrollView{

                Chart(data,id:\.self.0){ item in
                    BarMark(
                        x:.value("City", item.0),
                        y:.value("Sales", item.1)
                        
                    )
                } .chartOverlay { proxy in
                    GeometryReader { nthGeoItem in
                        Rectangle().fill(.clear).contentShape(Rectangle())
                            .gesture(DragGesture()
                                .onChanged { value in
                                    // Find the x-coordinates in the chart’s plot area.
                                    let xStart = value.startLocation.x - nthGeoItem[proxy.plotAreaFrame].origin.x
                                    let xCurrent = value.location.x - nthGeoItem[proxy.plotAreaFrame].origin.x
                                    // Find the date values at the x-coordinates.
                                    print("\(xStart),\(xCurrent)")
                                    //data.append(("x\(Int.random(in: 0...1000))",Int.random(in: 0...1000)))
                                }
                                .onEnded { _ in  } // Clear the state on gesture end.
                            )
                    }
                }
                .frame(width: 500, height: 500)
            }
                .navigationTitle("Bar Chart")
                .frame(width:300)
    }
}

struct BarView_Previews:PreviewProvider{
    static var previews: some View{
        BarView()
    }
}
