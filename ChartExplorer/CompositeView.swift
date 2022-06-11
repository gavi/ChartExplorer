//
//  Composite.swift
//  ChartExplorer
//
//  Created by Gavi Narra on 6/11/22.
//

import SwiftUI
import Charts

struct CompositeView:View{
    var data:[(String,Int,Int)] = []
    init(){
        for i in 0..<20{
            data.append(("\(i)",Int.random(in: 0..<500),Int.random(in: 0..<500)));
        }
    }
    var body: some View{
        VStack{
            Chart(data,id: \.0){item in
                BarMark(x:.value("City", item.0),y:.value("Value", item.1)).opacity(0.3)
                LineMark(x:.value("City", item.0),y:.value("Value", item.1))
                PointMark(x:.value("City", item.0),y:.value("Value", item.1))
                
                
            
            }
            
            
        }.navigationTitle("Composite Chart")
    }
}


struct CompositeView_Previews:PreviewProvider{
    static var previews: some View{
        CompositeView()
    }
}
