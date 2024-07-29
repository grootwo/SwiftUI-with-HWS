//
//  ContentView.swift
//  HotProspects
//
//  Created by Groo on 7/29/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 1
    var body: some View {
        TabView(selection: $selectedTab) {
            Button("Go to tab 2") {
                selectedTab = 2
            }
            .tabItem {
                Label("One", systemImage: "1.circle")
            }
            .tag(1)
            Button("Go to tab 1") {
                selectedTab = 1
            }
            .tabItem {
                Label("Two", systemImage: "2.circle")
            }
            .tag(2)
        }
    }
}

#Preview {
    ContentView()
}
