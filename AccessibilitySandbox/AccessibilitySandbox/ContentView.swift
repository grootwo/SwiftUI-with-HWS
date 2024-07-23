//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by Groo on 7/23/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello this is")
            Text("A TEXT")
                .font(.title)
        }
        .accessibilityElement()
        .accessibilityLabel("Hello this is a text")
    }
}

#Preview {
    ContentView()
}
