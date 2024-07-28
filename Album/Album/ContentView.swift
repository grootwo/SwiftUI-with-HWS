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
    var body: some View {
        NavigationStack {
            TabView {
                GridView()
                    .tabItem {
                        Image(systemName: "square.split.2x2")
                        Text("Grid")
                    }
                MapView()
                    .tabItem {
                        Image(systemName: "mappin.and.ellipse.circle")
                        Text("Map")
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
