//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Groo on 8/20/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hallo und Hallo")
            .font(.title)
            .offset(x: 250, y: 250)
            .background(.yellow)
    }
}

#Preview {
    ContentView()
}
