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
    @Query(sort: \Photo.name) var photos: [Photo]
    @State private var image: Image?
    var body: some View {
        NavigationStack {
            LazyVStack {
                VStack {
                    ForEach(photos) { photo in
                        Text(photo.name)
                        Image(data: photo.photo)
                    }
                }
            }
            .toolbar {
                NavigationLink("Add a photo") {
                    AddPhotoView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
