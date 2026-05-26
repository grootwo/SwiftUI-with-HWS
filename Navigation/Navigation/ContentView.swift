//
//  ContentView.swift
//  Navigation
//
//  Created by Groo on 6/15/24.
//

import SwiftUI

struct ContentView: View {
    @State private var navigationTitle = "Temporary title"
    var body: some View {
        NavigationStack {
            Text("This is Text")
                .navigationTitle($navigationTitle)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
