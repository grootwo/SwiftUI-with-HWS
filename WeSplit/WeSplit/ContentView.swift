//
//  ContentView.swift
//  WeSplit
//
//  Created by Groo on 4/25/24.
//

import SwiftUI

struct ContentView: View {
    @State var tapCount = 0
    @State private var text = ""
    @State private var selected = "orange"
    let picks = ["orange", "watermelon", "lemon", "apple"]
    var body: some View {
        NavigationStack {
            Form {
                TextField("Enter text", text: $text)
                Text("Entered text is \(text)")
                Picker("Select your favorite", selection: $selected) {
                    ForEach(picks, id: \.self) { pick in
                        Text(pick)
                    }
                }
                Section {
                    Text("This is a Form in Section 1")
                    Text("This is a Form")
                }
                Section {
                    Text("This is a Form in Section 2")
                    Text("This is a Form")
                }
            }
            .navigationTitle("Navigation title")
            .navigationBarTitleDisplayMode(.inline)
            Button("Tap Button") {
                tapCount += 1
            }
        }
    }
}

#Preview {
    ContentView()
}
