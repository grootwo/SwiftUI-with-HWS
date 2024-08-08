//
//  ContentView.swift
//  Flashzilla
//
//  Created by Groo on 8/8/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("hallo")
            Spacer().frame(height: 100)
            Text("hola")
        }
        .contentShape(.rect)
        .background(.orange)
        .onTapGesture {
            print("vstack")
        }
    }
}

#Preview {
    ContentView()
}
