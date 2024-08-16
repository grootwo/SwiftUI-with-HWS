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
    @State private var cards = Array<Card>(repeating: .example, count: 10)
    var body: some View {
        ZStack {
            ForEach(0..<cards.count, id: \.self) { index in
                CardView(card: cards[index])
                    .stacked(at: index, in: cards.count)
            }
        }
    }
}

#Preview {
    ContentView()
}
