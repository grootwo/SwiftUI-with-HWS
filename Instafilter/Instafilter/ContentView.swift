//
//  ContentView.swift
//  Instafilter
//
//  Created by Groo on 7/9/24.
//

import SwiftUI

struct ContentView: View {
    @State private var blurAmout = 0.0 {
        didSet {
            print("blur amount: \(blurAmout)")
        }
    }
    var body: some View {
        VStack {
            Text("This is a text")
                .blur(radius: blurAmout)
            Slider(value: $blurAmout, in: 0...10)
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
