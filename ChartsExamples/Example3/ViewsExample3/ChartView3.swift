//
//  ChartView3.swift
//  ChartsExamples
//
//  Created by Grace couch on 15/04/2025.
//

import SwiftUI
import Charts

struct ChartView3: View {
    let dailySales: [DailySalesType]
    let min: Double
    let max: Double
    let barColors: [Color]
    let xAxisPosition: AxisMarkPosition = .bottom
    let yAxisPosition: AxisMarkPosition = .leading
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ChartView3(dailySales: defaultDailySales, min: 100, max: 200, barColors: defaultColors)
}
