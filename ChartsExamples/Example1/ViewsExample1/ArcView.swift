//
//  ArcView.swift
//  ChartsExamples
//
//  Created by Grace couch on 24/02/2025.
//

import SwiftUI

struct ArcView: View {
    let color: Color
    let startRadius: CGFloat
    let endRadius: CGFloat
    let startTrim: CGFloat
    let endTrim: CGFloat
    let rotation: CGFloat
    @State private var finalTrim: CGFloat = 0

    var lineWidth: CGFloat {
        endRadius - startRadius
    }
    var finalRadius: CGFloat {
        endRadius - lineWidth
    }

    var body: some View {
        Circle()
            .trim(from: startTrim, to: finalTrim)
            .stroke(color, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
            .rotationEffect(.degrees(rotation))
            .frame(width: finalRadius, height: finalRadius)
            .onAppear {
                withAnimation {
                    finalTrim = endTrim
                }
            }
    }
}

#Preview {
    ArcView(color: .red, startRadius: 90, endRadius: 100, startTrim: 0.25, endTrim: 0.75, rotation: 30)
}
