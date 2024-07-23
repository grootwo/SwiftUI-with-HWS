//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by Groo on 7/23/24.
//

import SwiftUI

struct ContentView: View {
    let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096"
    ]
    let labels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks"
    ]
    @State private var currentPicture = Int.random(in: 0..<4)
    var body: some View {
        Button(action: {
            currentPicture = Int.random(in: 0..<4)
        }, label: {
            Image(pictures[currentPicture])
                .resizable()
                .scaledToFit()
        })
        .accessibilityLabel(labels[currentPicture])
        .accessibilityAddTraits(.isButton)
        .accessibilityRemoveTraits(.isImage)
    }
}

#Preview {
    ContentView()
}
