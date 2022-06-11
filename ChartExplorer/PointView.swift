//
//  PointView.swift
//  ChartExplorer
//
//  Created by Gavi Narra on 6/11/22.
//

import SwiftUI
import Charts


struct PointView:View{
    var data:[(String,Int,Int)]=[]
    
    init() {
        loadData()
    }
    
    mutating func loadData(){
        for i in 0..<100{
            self.data.append(("\(i)",Int.random(in: 1..<500),Int.random(in: 1..<500)))
        }
    }

    var body: some View{
        VStack{
            Text("Point View").bold()
            Chart(data,id:\.self.0){item in
                PointMark(x: .value(item.0, item.1), y: .value(item.0, item.2))
            }
        }
    }
}


struct PointView_Preview:PreviewProvider{
    static var previews: some View{
        PointView()
    }
}
