//
//  ContentView.swift
//  Instafilter
//
//  Created by Groo on 7/9/24.
//

import SwiftUI

struct ContentView: View {
    @State private var blurAmout = 0.0
    var body: some View {
        VStack {
            Text("This is a text")
                .blur(radius: blurAmout)
            Slider(value: $blurAmout, in: 0...10)
                .onChange(of: blurAmout) { oldValue, newValue in
                    print("blur amount: \(newValue)")
                }
            Button("Blur text randomly") {
                blurAmout = Double.random(in: 0...10)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
