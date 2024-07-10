//
//  ContentView.swift
//  Instafilter
//
//  Created by Groo on 7/9/24.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    @State private var image: Image?
    var body: some View {
        ContentUnavailableView("Not found", systemImage: "questionmark", description: Text("You find an empty page."))
    }
}

#Preview {
    ContentView()
}
