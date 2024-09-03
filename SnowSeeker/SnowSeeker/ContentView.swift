//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Groo on 9/3/24.
//

import SwiftUI

@Observable
class Player {
    var name = "Anonymous"
    var highScore = 0
}

struct ScoreView: View {
    @Environment(Player.self) var player
    var body: some View {
        @Bindable var player = player
        Stepper("Your high score: \(player.highScore)", value: $player.highScore)
    }
}

struct ContentView: View {
    @State private var player = Player()
    var body: some View {
        VStack {
            ScoreView()
        }
        .environment(player)
    }
}

#Preview {
    ContentView()
}
