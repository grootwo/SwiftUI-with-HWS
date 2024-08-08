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
                .onTapGesture {
                    print("text 1")
                }
                Text("Text")
                .highPriorityGesture(
                    TapGesture()
                        .onEnded {
                            print("text 2")
                        }
                )
        }
        .padding()
        .simultaneousGesture(
            TapGesture()
                .onEnded {
                    print("vstack")
                }
        )
    }
}

#Preview {
    ContentView()
}
