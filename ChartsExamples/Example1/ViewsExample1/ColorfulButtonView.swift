//
//  ColorfulButtonView.swift
//  ChartsExamples
//
//  Created by Grace couch on 24/02/2025.
//

import SwiftUI

struct ColorfulButtonView: View {
    @State var colors: [Color]
    let dim: CGFloat
    let offset: CGFloat
    let action: () -> Void

    @State private var flip = false

    var count: CGFloat {
        CGFloat(colors.count)
    }

    var lineWidth: CGFloat {
        (dim - offset) / count
    }

    var lastColor: Color {
        colors.last ?? .red
    }

    func minRadius(i: Int, offset: CGFloat) -> CGFloat {
        lineWidth * CGFloat(i) + offset
    }
    func maxRadius(i: Int, offset: CGFloat) -> CGFloat {
        lineWidth * CGFloat(i + 1) + offset
    }

    var body: some View {
        ZStack {
            ForEach(0..<colors.count, id: \.self) { i in
                RandomArcFromColorsView(
                    colors: colors,
                    index: i,
                    minRadius: minRadius(i: i, offset: offset),
                    maxRadius: maxRadius(i: i, offset: offset),
                    opacity: 1)
            }
            Circle()
                .stroke(lastColor, lineWidth: lineWidth)
                .frame(width: dim, height: dim)
        }
        .rotation3DEffect(.degrees(flip ? .zero : 180), axis: (x: Double.random(in: -1...1), y: Double.random(in: -1...1), z: 0 ))
        .onTapGesture {
            withAnimation {
                colors = [.red, .blue, .green, .pink, .cyan, .orange]
                flip.toggle()
            }
            action()
        }
    }
}

#Preview {
    ColorfulButtonView(colors: [.red, .blue, .green, .pink, .cyan, .orange], dim: 100, offset: 10) {

    }
}
