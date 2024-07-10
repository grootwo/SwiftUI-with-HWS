//
//  ContentView.swift
//  Instafilter
//
//  Created by Groo on 7/9/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ContentUnavailableView {
            Label("Not found", systemImage: "questionmark")
        } description: {
            Text("You found an empty page.")
        } actions: {
            Button("Go back") {
                // create a snippet
            }
            .buttonStyle(.bordered)
        }
    }
}

#Preview {
    ContentView()
}
