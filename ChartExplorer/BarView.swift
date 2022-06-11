//
//  BarView.swift
//  ChartExplorer
//
//  Created by Gavi Narra on 6/11/22.
//

import SwiftUI
import Charts

struct BarView:View{
    let data = [("New York",900),("Pittsburgh",600), ("Chicago",1200)]
    var body: some View{
        VStack{
            Chart(data,id:\.self.0){ item in
                BarMark(
                    x:.value("City", item.0),
                    y:.value("Sales", item.1)
                    
                )
            }
        }.navigationTitle("Bar Chart")
    }
}

struct BarView_Previews:PreviewProvider{
    static var previews: some View{
        BarView()
    }
}
