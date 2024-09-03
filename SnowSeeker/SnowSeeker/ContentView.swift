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
    @State private var isShowingAlert = false
    var body: some View {
        Button("Tap to create User") {
            user = User()
            isShowingAlert = true
        }
        .alert("Hallo", isPresented: $isShowingAlert, presenting: user) { user in
            Text(user.id)
        }
    }
}

#Preview {
    ContentView()
}
