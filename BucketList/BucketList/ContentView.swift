//
//  ContentView.swift
//  BucketList
//
//  Created by Groo on 7/16/24.
//

import MapKit
import SwiftUI

struct ContentView: View {
    var body: some View {
        Map(interactionModes: [.rotate, .zoom])
            .mapStyle(.imagery)
    }
}

#Preview {
    ContentView()
}
