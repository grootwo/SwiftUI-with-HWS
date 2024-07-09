//
//  ContentView.swift
//  Instafilter
//
//  Created by Groo on 7/9/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showingconfirmationDialog = false
    @State private var backgroundColor = Color.white
    var body: some View {
        Button("Tap to change background color") {
            showingconfirmationDialog = true
        }
        .background(backgroundColor)
        .frame(width: 100, height: 100)
        .confirmationDialog("Set Color", isPresented: $showingconfirmationDialog) {
            Button("Yellow") { backgroundColor = Color.yellow }
            Button("Cyan") { backgroundColor = Color.cyan }
            Button("Mint") { backgroundColor = Color.mint }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Which color do you want?")
        }
    }
}

#Preview {
    ContentView()
}
