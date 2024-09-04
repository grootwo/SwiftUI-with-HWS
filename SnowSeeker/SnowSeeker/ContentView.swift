//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Groo on 9/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ViewThatFits {
            Rectangle()
                .frame(width: 500, height: 200)
            Circle()
                .frame(width: 200, height: 200)
        }
    }
}

#Preview {
    ContentView()
}
