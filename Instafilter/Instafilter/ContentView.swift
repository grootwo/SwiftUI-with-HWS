//
//  ContentView.swift
//  Instafilter
//
//  Created by Groo on 7/9/24.
//

import SwiftUI
import StoreKit

struct ContentView: View {
    @State private var processedImage: Image?
    @State private var intensityAmount = 0.0
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                if let processedImage {
                    processedImage
                        .resizable()
                        .scaledToFit()
                } else {
                    ContentUnavailableView("No picture", systemImage: "photo.badge.plus", description: Text("Click to import a picture"))
                }
                Spacer()
                HStack {
                    Text("Intensity")
                    Slider(value: $intensityAmount)
                }
                Button("Change filter", action: changeFilter)
            }
            .padding()
            .navigationTitle("Instafilter")
        }
    }
    func changeFilter() {
        
    }
}

#Preview {
    ContentView()
}
