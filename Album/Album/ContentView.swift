//
//  ContentView.swift
//  Album
//
//  Created by Groo on 7/26/24.
//

import SwiftUI
import SwiftData
import MapKit

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Photo.name) var photos: [Photo]
    @State private var image: Image?
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        NavigationStack {
            TabView {
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(photos) { photo in
                            NavigationLink(destination: PhotoView(photo: photo)) {
                                VStack {
                                    Image(data: photo.photo)!
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 150)
                                    Text(photo.name)
                                }
                            }
                        }
                    }
                }
                .tabItem {
                    Image(systemName: "square.split.2x2")
                    Text("List")
                }
                .toolbar {
                    NavigationLink("Add a photo") {
                        AddPhotoView()
                    }
                }
                Map()
                    .tabItem {
                        Image(systemName: "mappin.and.ellipse.circle")
                        Text("Map")
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
