//
//  ContentView.swift
//  Album
//
//  Created by Groo on 7/26/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var photos: [Photo]
    var body: some View {
        LazyVStack {
            VStack {
                ForEach(photos) { photo in
                    Text(photo.name)
                }
            }
        }
        .toolbar {
            Button("Add photo", systemImage: "plus") {
                
            }
        }
    }
}

#Preview {
    ContentView()
}
