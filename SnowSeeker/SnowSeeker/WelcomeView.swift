//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by Groo on 9/4/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to SnowSeeker!")
                .font(.largeTitle)
            Text("Please select a resort from the left-hand menu; Swipe from the left edge to see the list of resorts.")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    WelcomeView()
}
