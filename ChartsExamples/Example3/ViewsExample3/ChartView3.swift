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
    let xAxisPosition: AxisMarkPosition = .bottom
    let yAxisPosition: AxisMarkPosition = .leading
    let dimensions: [String] = ["Horizontal", "Vertical"]

    @State private var barColors: [Color] = defaultColors
    @State private var chartType: ChartType = .bar
    @State private var verticalChart: Bool = true

    var body: some View {
        VStack {
            HStack {
                Text("Chart Example 3")
                    .font(.largeTitle.bold())

            }
            Chart {
                ForEach(dailySales) { weekday in
                    if verticalChart {
                        switch chartType {
                        case .line:
                            LineMark(x: .value("Day", weekday.day),
                                     y: .value("Sales", weekday.sales))
                        case .bar:
                            BarMark(x: .value("Day", weekday.day),
                                    y: .value("Sales", weekday.sales))
                        case .area:
                            AreaMark(x: .value("Day", weekday.day),
                                     y: .value("Sales", weekday.sales))
                        }
                    } else {
                        switch chartType {
                        case .line:
                            LineMark(x: .value("Sales", weekday.sales),
                                     y: .value("Day", weekday.day))
                        case .bar:
                            BarMark(x: .value("Sales", weekday.sales),
                                    y: .value("Day", weekday.day))
                        case .area:
                            AreaMark(x: .value("Sales", weekday.sales),
                                     y: .value("Day", weekday.day))
                        }
                    }
                }
            }
            HStack {
                Button("", systemImage: "chart.bar.xaxis") {
                    withAnimation {
                        verticalChart.toggle()
                    }
                }
                .font(.title)
                .rotationEffect(.degrees(verticalChart ? 0 : 90))
                Spacer()
                Picker("Chart Type", selection: $chartType) {
                    ForEach(ChartType.allCases, id: \.self) { chart in
                        Text(chart.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                Spacer()
                ColorfulButtonView(colors: $barColors, dim: 30, offset: 10) {

                }
            }
        }
        .padding()
    }
}

#Preview {
    ChartView3(dailySales: defaultDailySales, min: 50, max: 250)
}
