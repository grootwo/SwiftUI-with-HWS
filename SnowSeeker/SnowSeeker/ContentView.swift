//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Groo on 9/3/24.
//

import SwiftUI

struct User: Identifiable {
    let id = "Unknown"
}

struct ContentView: View {
    @State private var user: User? = nil
    var body: some View {
        Button("Tap to create User") {
            user = User()
        }
        .sheet(item: $user, content: { user in
            Text(user.id)
                .presentationDetents([.medium, .large])
        })
    }
}

#Preview {
    ContentView()
}
