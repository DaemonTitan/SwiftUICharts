//
//  LineChartsPlayground.swift
//  SwiftUICharts
//
//  Created by Tony Chen on 23/2/2024.
//

import SwiftUI
import Charts

struct LineChartsPlayground: View {
    @State private var isAnimate = false
    
    var itemValue: [ChartsModels] = [
        ChartsModels(type: "Jan", value: 100),
        ChartsModels(type: "Feb", value: 35),
        ChartsModels(type: "Mar", value: 72),
        ChartsModels(type: "Apr", value: 22)
    ]
    
    var body: some View {
        Chart(itemValue) {
               LineMark(
                x: .value("Month", $0.type),
                y: .value("Value", $0.value))
           }
           .onAppear {
               for(index,_) in itemValue.enumerated() {
                   withAnimation(.easeInOut(duration: 1).delay(10)) {
                       
                   }
               }
               
               
           }
       }
        

}

#Preview {
    LineChartsPlayground()
}
