//
//  TestButtonView.swift
//  ChartsExamples
//
//  Created by Grace couch on 25/02/2025.
//

import SwiftUI

struct TestButtonView: View {
    @State var colors: [Color]
    var count: CGFloat {
        CGFloat(colors.count)
    }
    var barWidth: CGFloat {
        (UIScreen.main.bounds.width / count) - 5
    }
    let threshold = 30.0

    @State private var rotateBar = false
    @State private var tilt: CGFloat = 0.0

    var body: some View {
        NavigationStack {
            HStack(alignment: .bottom, spacing: 4) {
                ForEach(colors, id: \.self) { color in
                    let height = Double.random(in: 50...200)
                    BarView(color: color, barWidth: barWidth, height: height)
                }
            }
            .rotation3DEffect(.degrees(rotateBar ? 180 : 0), axis: (x: 0, y: 1, z: 0))
            .rotation3DEffect(.degrees(-tilt * 45), axis: (x: 0, y: 1, z: 0))
            .scaleEffect(tilt != 0 ? 0.8 : 1)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        withAnimation {
                            if value.translation.width > threshold {
                                tilt = -1
                            } else if value.translation.width < -threshold {
                                tilt = 1
                            } else {
                                tilt = 0
                            }
                        }
                    }
            )
            .onTapGesture {
                withAnimation {
                    tilt = 0
                }
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    ColorfulButtonView(colors: $colors, dim: 50, offset: 10) {
                        withAnimation {
                            rotateBar.toggle()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    TestButtonView(colors: [.red, .blue, .purple, .brown, .orange, .pink])
}
