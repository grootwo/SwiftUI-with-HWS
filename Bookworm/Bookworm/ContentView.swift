//
//  ContentView.swift
//  Bookworm
//
//  Created by Groo on 6/27/24.
//

import SwiftUI

struct CustomButton: View {
    @Binding var isYes: Bool
    var body: some View {
        Button("Yes or No") {
            isYes.toggle()
        }
        .buttonStyle(.borderedProminent)
    }
}

struct ContentView: View {
    @State private var isYes = false
    var body: some View {
        Text(isYes ? "Yes!" : "No...")
        CustomButton(isYes: $isYes)
    }
}

#Preview {
    ContentView()
}
