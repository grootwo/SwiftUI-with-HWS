//
//  ContentView.swift
//  Flashzilla
//
//  Created by Groo on 8/8/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("Double Tap")
                .onTapGesture(count: 2) {
                    print("double tap")
                }
            Text("Long Press")
                .onLongPressGesture {
                    print("long pressed")
                }
            Text("Long Press at least 3 seconds")
                .onLongPressGesture {
                    print("long pressed for 3 sec")
                } onPressingChanged: { inProgress in
                    print("in progress: \(inProgress)")
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
