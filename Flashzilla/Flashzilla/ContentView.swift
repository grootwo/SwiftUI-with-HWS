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
    @Environment(\.accessibilityVoiceOverEnabled) var accessibilityVoiceOverEnabled
    @Environment(\.scenePhase) var scenePhase
    @State private var cards = [Card]()
    @State private var timeRemaining = 100
    @State private var isActive = true
    @State private var isShowingEditView = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack {
            Image(decorative: "background")
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
                        .accessibilityHidden(index < cards.count - 1)
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
            VStack {
                HStack {
                    Spacer()
                    Button {
                        isShowingEditView = true
                    } label: {
                        Image(systemName: "checkmark.circle")
                            .font(.title)
                            .padding()
                            .foregroundColor(.white)
                            .background(.black.opacity(0.7))
                            .clipShape(.circle)
                    }
                    .offset(y: 90)
                }
                Spacer()
            }
            if accessibilityDifferentiateWithoutColor || accessibilityVoiceOverEnabled {
                VStack {
                    Spacer()
                    HStack {
                        Button {
                            removeCard(at: cards.count - 1)
                        } label: {
                            Image(systemName: "xmark.circle")
                                .padding()
                                .background(.black.opacity(0.7))
                                .clipShape(.circle)
                        }
                        .accessibilityLabel("Wrong")
                        .accessibilityHint("Mark your answer as being incorrect.")
                        Spacer()
                        Button {
                            removeCard(at: cards.count - 1)
                        } label: {
                            Image(systemName: "checkmark.circle")
                                .padding()
                                .background(.black.opacity(0.7))
                                .clipShape(.circle)
                        }
                        .accessibilityLabel("Correct")
                        .accessibilityHint("Mark your answer as being correct.")
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
        .sheet(isPresented: $isShowingEditView, onDismiss: resetCards, content: EditCardsView.init)
        .onAppear(perform: loadData)
    }
    
    func removeCard(at index: Int) {
        guard index >= 0 else { return }
        cards.remove(at: index)
        if cards.isEmpty {
            isActive = false
        }
    }
    func resetCards() {
        isActive = true
        timeRemaining = 100
        loadData()
    }
    func loadData() {
        if let data = UserDefaults.standard.data(forKey: "Cards") {
            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
                cards = decoded
            }
        }
    }
}

#Preview {
    ContentView()
}
