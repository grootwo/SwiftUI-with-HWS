//
//  ContentView.swift
//  Instafilter
//
//  Created by Groo on 7/9/24.
//

import SwiftUI

struct ContentView: View {
    let cat = Image(.cat)
    var body: some View {
        ShareLink(item: cat, preview: SharePreview("cat image", image: cat)) {
            Label("Click to share", systemImage: "cat.fill")
        }
    }
}

#Preview {
    ContentView()
}
