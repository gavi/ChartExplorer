//
//  AreaView.swift
//  ChartExplorer
//
//  Created by Gavi Narra on 6/13/22.
//

import SwiftUI
import Charts

struct AreaView: View{
    let data =
        [("NYC",1,500),("NYC",2,500),("Pittsburgh",1,200),("Pittsburgh",2,200)]
    
    var body: some View{
        VStack{
            Text("Area View").bold()
            Chart(data,id:\.0){item in
                AreaMark(x: .value("City", item.1), y: .value("Sales", item.2))
                    .foregroundStyle(by: .value("City",item.0))
            }
            
        }
    }
}

struct AreaView_Previews:PreviewProvider{
    static var previews: some View{
        AreaView()
    }
}

