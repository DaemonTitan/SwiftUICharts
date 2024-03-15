//
//  LineCharts.swift
//  SwiftUICharts
//
//  Created by Tony Chen on 12/2/2024.
//

import SwiftUI
import Charts

struct LineCharts: View {
    
    @State var isAnimate = false
    
    let itemValue: [ChartsModels] = [
        ChartsModels(type: "Jan", value: 100),
        ChartsModels(type: "Feb", value: 35),
        ChartsModels(type: "Mar", value: 72),
        ChartsModels(type: "Apr", value: 22),
        ChartsModels(type: "May", value: 130),
        ChartsModels(type: "Jun", value: 202),
        ChartsModels(type: "Jul", value: 250),
        ChartsModels(type: "Aug", value: 180),
        ChartsModels(type: "Sep", value: 175),
        ChartsModels(type: "Oct", value: 163),
        ChartsModels(type: "Nov", value: 100),
        ChartsModels(type: "Dec", value: 80)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // Bar, Line, area, ruler, point
                // Bar chart - horizotal
                VStack(alignment: .leading, spacing: 4) {
                    Text("Value number")
                        .font(.headline)
                        .padding(.horizontal)
                    Text("Total: \(itemValue.reduce(0, { $0 + $1.value }))")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal)
                    
                    Chart(itemValue) { item in
                        RuleMark(y: .value("Goal", 180))
                            .foregroundStyle(Color.blue)
                            .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
                            .annotation(alignment: .leading) {
                                Text("Goal")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        BarMark(
                            x: .value("Moth", item.type),
                            y: .value("Profit", item.value)
                        )
                       
                    }
                    .chartYAxis(content: {
                        AxisMarks { mark in
                            AxisValueLabel()
                            //AxisGridLine()
                            
                        }
                    })
                    
                    .chartXAxis(content: {
                        AxisMarks { mark in
                            AxisValueLabel()
                            //AxisGridLine()
                        }
                    })
                    .foregroundStyle(Color.red.gradient)
                    .frame(height: 200)
                .padding()
                }
                
                
                // Bar chart - vertical
                Chart(itemValue) { item in
                    BarMark(
                        x: .value("Profit", item.value),
                        y: .value("Moth", item.type)
                    )
                   
                }
                .foregroundStyle(Color.red.gradient)
                .frame(height: 200)
                .padding()
                // Hide Y axis label
                .chartYAxis(.hidden)
                // Setup X scale
                .chartXScale(domain: 0...400)
                
                // Line Chart
                Chart(itemValue) { item in
                    LineMark(
                        x: .value("Moth", item.type),
                        y: .value("Profit", item.value)
                    )
                   
                }
                .onAppear {
                    withAnimation(.linear) {
                        isAnimate.toggle()
                    }
                }
                
                .foregroundStyle(Color.blue.gradient)
                .frame(height: 200)
                .padding()
                .chartPlotStyle { plotContent in
                    plotContent
                        .background(Color.gray.opacity(0.3))
                        .border(Color.green, width: 3)
                }
                
                // Area Chart
                Chart(itemValue) { item in
                    AreaMark(
                        x: .value("Moth", item.type),
                        y: .value("Profit", item.value)
                    )
                   
                }
                .foregroundStyle(Color.green.gradient)
                .frame(height: 200)
                .padding()
                
                // Point Chart
                Chart(itemValue) { item in
                    PointMark(
                        x: .value("Moth", item.type),
                        y: .value("Profit", item.value)
                    )
                   
                }
                .foregroundStyle(Color.pink.gradient)
                .frame(height: 200)
                .padding()
                
 
            }
            .navigationTitle("Charts")
        }
    }
}

#Preview {
    LineCharts()
}
