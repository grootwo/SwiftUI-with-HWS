//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Groo on 8/20/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Text("IMPORTANT")
                .frame(width: 200)
                .background(.blue)
            
            GeometryReader { proxy in
                Image(.example)
                    .resizable()
                    .scaledToFit()
                    .frame(width: proxy.size.width * 0.8, height: proxy.size.height)
            }
        }
    }
}

#Preview {
    ContentView()
}
