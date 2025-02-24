//
//  ChartsExamplesApp.swift
//  ChartsExamples
//
//  Created by Grace couch on 24/02/2025.
//

import SwiftUI

@main
struct ChartsExamplesApp: App {
    var body: some Scene {
        WindowGroup {
            ArcView(color: .red, startRadius: 90, endRadius: 100, startTrim: 0.25, endTrim: 0.75, rotation: 30)
        }
    }
}
