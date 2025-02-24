//
//  RandomArcFromColorsView.swift
//  ChartsExamples
//
//  Created by Grace couch on 24/02/2025.
//

import SwiftUI

struct RandomArcFromColorsView: View {
    let colors: [Color]
    let index: Int
    let minRadius: CGFloat
    let maxRadius: CGFloat
    let opacity: CGFloat

    let startTrim = Double.random(in: 0...0.5)
    let endTrim = 1.0

    var isValidIndex: Bool {
        index >= colors.count && index >= 0
    }
    var theIndex: Int{
        if isValidIndex {
            return index
        } else {
            return 0
        }
    }
    var color: Color {
        colors[theIndex]
    }
    var count: CGFloat {
        CGFloat(colors.count)
    }
    var endRadius: CGFloat {
        (minRadius + maxRadius)/count
    }
    var rotation: CGFloat {
        Double.random(in: 0...360)
    }

    var body: some View {
        ArcView(color: color.opacity(opacity),
                startRadius: minRadius,
                endRadius: endRadius,
                startTrim: startTrim,
                endTrim: endTrim,
                rotation: rotation)
    }
}

#Preview {
    RandomArcFromColorsView(colors: [.red, .blue, .green], index: 2, minRadius: 90, maxRadius: 120, opacity: 1)
}
