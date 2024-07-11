//
//  ContentView.swift
//  Instafilter
//
//  Created by Groo on 7/9/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ShareLink(item: URL(string: "https://www.youtube.com/watch?v=ZsCfVcBFlt4&list=PL-v5Ft0MHPi0kO89KThPO7yMu5eFr9qVJ&index=6")!, subject: Text("This is a great song."), message: Text("Do you want to try this?")) {
            VStack {
                Image(systemName: "music.note")
                    .font(.title)
                Text("Share \"I've always get this way\"")
            }
        }
    }
}

#Preview {
    ContentView()
}
