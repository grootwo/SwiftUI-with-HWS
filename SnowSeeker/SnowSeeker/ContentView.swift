//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Groo on 9/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            NavigationLink("Tap to Next View") {
                Text("Next View")
            }
        } detail: {
            Text("Main View")
                .toolbar(.hidden, for: .navigationBar)
        }
        .navigationSplitViewStyle(.balanced)
    }
}

#Preview {
    ContentView()
}
