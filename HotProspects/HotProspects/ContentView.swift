//
//  ContentView.swift
//  HotProspects
//
//  Created by Groo on 7/29/24.
//

import SwiftUI

struct ContentView: View {
    @State private var backgroundColor = Color.teal
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(backgroundColor)
            Image(.monkey)
                .resizable()
                .scaledToFit()
                .contextMenu {
                    Button("Pink", role: .destructive) {
                        backgroundColor = Color.pink
                    }
                    Button("Brown", role: .cancel) {
                        backgroundColor = Color.brown
                    }
                    Button("Teal", systemImage: "suit.heart") {
                        backgroundColor = Color.teal
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
