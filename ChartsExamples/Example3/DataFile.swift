//
//  DataFile.swift
//  ChartsExamples
//
//  Created by Grace couch on 15/04/2025.
//

import SwiftUI

struct DailySalesType: Identifiable {
    let id = UUID()
    let day: String
    let sales: Double
}
let defaultColors: [Color] =  [.blue, .purple, .orange, .red, .green, .pink, .yellow]
let defaultDailySales: [DailySalesType] = [ .init(day: "Mon", sales: 120.3),
                                 .init(day: "Tues", sales: 133.5),
                                 .init(day: "Weds", sales: 170.8),
                                 .init(day: "Thurs", sales: 122.7),
                                 .init(day: "Fri", sales: 154.2),
                                 .init(day: "Sat", sales: 149.8),
                                 .init(day: "Sun", sales: 116.1)
]

enum ChartType: String, CaseIterable {
    case line = "Line"
    case bar = "Bar"
    case area = "Area"
}
