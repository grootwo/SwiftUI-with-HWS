//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Groo on 9/3/24.
//

import SwiftUI

struct TextView: View {
    var body: some View {
        Group {
            Text("하나: One, Eins, Uno")
            Text("둘: Two, Zwei, Dos")
            Text("셋: Three, Drei, Tres")
        }
        .font(.title)
    }
}

struct ContentView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var body: some View {
        if horizontalSizeClass == .compact {
            VStack {
                TextView()
            }
        } else {
            HStack {
                TextView()
            }
        }
    }
}

#Preview {
    ContentView()
}
