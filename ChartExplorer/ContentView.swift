//
//  ContentView.swift
//  ChartExplorer
//
//  Created by Gavi Narra on 6/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List{
                NavigationLink{
                        BarView()
                    }
                label:{
                    Text("Bar")
                }
                NavigationLink{
                        PointView()
                    }
                label:{
                    Text("Point")
                }
                NavigationLink{
                        LineView()
                    }
                label:{
                    Text("Line")
                }
                NavigationLink{
                        CompositeView()
                    }
                label:{
                    Text("Composite")
                }
                NavigationLink{
                        AccelerometerView()
                    }
                label:{
                    Text("Accelerometer")
                }
            }.navigationTitle("Chart Types")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
