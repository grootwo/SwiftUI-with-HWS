//
//  ContentView.swift
//  Flashzilla
//
//  Created by Groo on 8/8/24.
//

import SwiftUI

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        return self.offset(y: Double(total - position) * 10)
    }
}

struct ContentView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor
    @Environment(\.scenePhase) var scenePhase
    @State private var cards = Array<Card>(repeating: .example, count: 10)
    @State private var timeRemaining = 10
    @State private var isActive = true
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                Text("Time: \(timeRemaining)")
                    .font(.title)
                    .padding()
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.7))
                    .clipShape(.capsule)
                ZStack {
                    ForEach(0..<cards.count, id: \.self) { index in
                        CardView(card: cards[index]) {
                            withAnimation {
                                removeCard(at: index)
                            }
                        }
                        .stacked(at: index, in: cards.count)
                        .allowsHitTesting(index == cards.count - 1)
                    }
                }
                .allowsHitTesting(timeRemaining > 0)
                if cards.isEmpty {
                    Button("Reset cards", action: resetCards)
                        .font(.title)
                        .padding()
                        .foregroundStyle(.black)
                        .background(.white.opacity(0.7))
                        .clipShape(.capsule)
                }
            }
            if accessibilityDifferentiateWithoutColor {
                VStack {
                    Spacer()
                    HStack {
                        Image(systemName: "xmark.circle")
                            .padding()
                            .background(.black.opacity(0.7))
                            .clipShape(.circle)
                        Spacer()
                        Image(systemName: "checkmark.circle")
                            .padding()
                            .background(.black.opacity(0.7))
                            .clipShape(.circle)
                    }
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .padding()
                    .offset(y: -50)
                }
            }
        }
        .onReceive(timer) { time in
            guard isActive else { return }
            if timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
        .onChange(of: scenePhase) {
            if scenePhase == .active && !cards.isEmpty {
                isActive = true
            } else {
                isActive = false
            }
        }
    }
    
    func removeCard(at index: Int) {
        cards.remove(at: index)
        if cards.isEmpty {
            isActive = false
        }
    }
    func resetCards() {
        cards = Array<Card>(repeating: .example, count: 10)
        isActive = true
        timeRemaining = 10
    }
}

#Preview {
    ContentView()
}
