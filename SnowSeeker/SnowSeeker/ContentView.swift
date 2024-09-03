//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Groo on 9/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    let animals = ["cat", "dog", "elephant", "owl", "tiger", "koala"]
    var filteredAnimals: [String] {
        if searchText.isEmpty {
            return animals
        } else {
            return animals.filter { $0.localizedStandardContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationStack {
            List(filteredAnimals, id: \.self) { animal in
                Text(animal)
            }
            .searchable(text: $searchText, prompt: "Look for something")
        }
    }
}

#Preview {
    ContentView()
}
