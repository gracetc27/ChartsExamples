//
//  ChartsDemo2.swift
//  ChartsExamples
//
//  Created by Grace couch on 25/02/2025.
//
import Charts
import SwiftUI

struct ChartsDemo2: View {
    @State private var isLegendVisible = false
    var body: some View {
        let min = -500.0
        let max = 500.0
        NavigationStack {
            Chart {
                BarMark(
                    x: .value("Day", "Monday"),
                    y: .value("Sales", 100)
                )
                .foregroundStyle(by: .value("Day", "Monday"))
                .annotation {
                    Image(systemName: "sun.max.fill")
                        .foregroundStyle(.red)
                }
                BarMark(
                    x: .value("Day", "Tuesday"),
                    y: .value("Sales", 90)
                )
                .foregroundStyle(by: .value("Day", "Tuesday"))
                BarMark(
                    x: .value("Day", "Wednesday"),
                    y: .value("Sales", -50)
                )
                .foregroundStyle(by: .value("Day", "Wednesday"))
                BarMark(
                    x: .value("Day", "Thursday"),
                    y: .value("Sales", 120)
                )
                .foregroundStyle(by: .value("Day", "Thursday"))
            }

            .chartYScale(domain: min...max)
            .chartXAxis {
                AxisMarks(position: .bottom)
            }
            .padding()
            .chartLegend(isLegendVisible ? .visible : .hidden)
            .chartLegend(position: .top)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Show Key") {
                        isLegendVisible.toggle()
                    }
                }
            }
        }
    }
}

#Preview {
    ChartsDemo2()
}
