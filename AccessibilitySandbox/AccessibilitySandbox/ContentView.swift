//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by Groo on 7/23/24.
//

import SwiftUI

struct ContentView: View {
    @State private var value = 0
    var body: some View {
        Button("Tap to print message") {
            print("printing message")
        }
        .accessibilityInputLabels(["print", "print message", "tap to print"])
    }
}

#Preview {
    ContentView()
}
