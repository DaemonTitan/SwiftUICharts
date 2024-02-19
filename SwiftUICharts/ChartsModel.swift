//
//  ChartsModel.swift
//  SwiftUICharts
//
//  Created by Tony Chen on 12/2/2024.
//

import Foundation

struct ChartsModels: Identifiable {
    let id = UUID()
    let type: String
    let value: Double
    
    init(type: String, value: Double) {
        self.type = type
        self.value = value
    }
    
    
    
    
}
