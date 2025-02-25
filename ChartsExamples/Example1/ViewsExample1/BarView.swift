//
//  BarView.swift
//  ChartsExamples
//
//  Created by Grace couch on 25/02/2025.
//

import SwiftUI

struct BarView: View {
    let color: Color
    let barWidth: CGFloat
    let height: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(color)
            .frame(width: barWidth, height: height)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.black, lineWidth: 0.7)
                    .frame(width: barWidth, height: height)
            )
    }
}

#Preview {
    BarView(color: .red, barWidth: 25, height: 75)
}
