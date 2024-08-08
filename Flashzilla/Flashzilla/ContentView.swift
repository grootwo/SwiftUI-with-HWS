//
//  ContentView.swift
//  Flashzilla
//
//  Created by Groo on 8/8/24.
//

import SwiftUI

struct ContentView: View {
    @State private var currentValue = Angle.zero
    @State private var finalValue = Angle.zero
    var body: some View {
        VStack(spacing: 30) {
            Text("Text")
                .font(.largeTitle)
                .rotationEffect(currentValue + finalValue)
                .gesture(
                    RotateGesture()
                        .onChanged { value in
                            currentValue += value.rotation
                        }
                        .onEnded { value in
                            finalValue += currentValue
                            currentValue = Angle.zero
                        }
                )
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
