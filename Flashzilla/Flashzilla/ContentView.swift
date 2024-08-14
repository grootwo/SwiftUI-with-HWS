//
//  ContentView.swift
//  Flashzilla
//
//  Created by Groo on 8/8/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency

    var body: some View {
        Text("Hello, World!")
            .blur(radius: reduceTransparency ? 0 : 0.5)
            .padding()
            .background(reduceTransparency ? .black : .secondary)
            .foregroundStyle(.white)
            .clipShape(.capsule)
    }
}

#Preview {
    ContentView()
}
