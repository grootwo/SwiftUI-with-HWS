//
//  ContentView.swift
//  HotProspects
//
//  Created by Groo on 7/29/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = Set<String>()
    let animals = ["cat", "dog", "elephant", "koala"]
    var body: some View {
        NavigationStack{
            VStack {
                List(animals, id: \.self, selection: $selection) { animal in
                    Text(animal)
                }
                if selection.isEmpty == false {
                    Text("your selection: \(selection)")
                }
            }
            .toolbar {
                EditButton()
            }
        }
    }
}

#Preview {
    ContentView()
}
