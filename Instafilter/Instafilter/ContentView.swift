//
//  ContentView.swift
//  Instafilter
//
//  Created by Groo on 7/9/24.
//

import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
    }
    func loadImage() {
        image = Image(.cat)
    }
}

#Preview {
    ContentView()
}
