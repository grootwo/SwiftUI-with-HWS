//
//  ContentView.swift
//  Instafilter
//
//  Created by Groo on 7/9/24.
//

import SwiftUI
import StoreKit

struct ContentView: View {
    @Environment(\.requestReview) var requestReview
    var body: some View {
        Button("Leave your review") {
            requestReview()
        }
    }
}

#Preview {
    ContentView()
}
