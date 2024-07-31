//
//  ContentView.swift
//  HotProspects
//
//  Created by Groo on 7/29/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            Text("You can swipe this row")
                .swipeActions {
                    Button("Like", systemImage: "heart.fill") {
                        print("like")
                    }
                    .tint(.pink)
                }
                .swipeActions(edge: .leading) {
                    Button("Bookmark", systemImage: "bookmark.fill") {
                        print("bookmark")
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
