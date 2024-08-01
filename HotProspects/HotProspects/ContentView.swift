//
//  ContentView.swift
//  HotProspects
//
//  Created by Groo on 7/29/24.
//

import SwiftUI
import SamplePackage

struct ContentView: View {
    var body: some View {
        TabView {
            ProspectsView(filterType: .none)
                .tabItem {
                    Label("Everyone", systemImage: "person.3")
                }
            ProspectsView(filterType: .contacted)
                .tabItem {
                    Label("Contacted", systemImage: "checkmark.circle")
                }
            ProspectsView(filterType: .uncontacted)
                .tabItem {
                    Label("Uncontacted", systemImage: "questionmark.diamond")
                }
            MeView()
                .tabItem {
                    Label("Me", systemImage: "person.crop.square")
                }
        }
    }
}

#Preview {
    ContentView()
}
