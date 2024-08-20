//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Groo on 8/20/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Live long and prosper")
                .frame(width: 300, height: 300, alignment: .bottomTrailing)
                .background(.yellow)
            HStack(alignment: .firstTextBaseline) {
                Text("Living")
                    .font(.caption)
                Text("long")
                Text("ang")
                    .font(.title)
                Text("prosper")
                    .font(.largeTitle)
            }
            .background(.green)
        }
    }
}

#Preview {
    ContentView()
}
