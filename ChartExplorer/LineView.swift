//
//  LineView.swift
//  ChartExplorer
//
//  Created by Gavi Narra on 6/11/22.
//

import SwiftUI
import Charts

struct LineView:View{
    var data:[(String,Int,Int)] = []
    init(){
        for i in 0..<100{
            data.append(("\(i)",Int.random(in: 0..<500),Int.random(in: 0..<500)))
        }
    }
    var body: some View{
        VStack{
            Text("Line Chart").bold()
            Chart(data,id:\.0){item in
                LineMark(x: .value("key", item.0), y: .value("val", item.1))
            }
        }
        
    }
}

struct LineView_Previews:PreviewProvider{
    static var previews: some View{
        LineView()
    }
}
