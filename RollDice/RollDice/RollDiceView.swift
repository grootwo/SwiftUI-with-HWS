//
//  RollDiceView.swift
//  RollDice
//
//  Created by Groo on 9/2/24.
//

import SwiftUI

struct RollDiceView: View {
    @State private var newNumber: Int? = nil
    var body: some View {
        Text(newNumber == nil ? "?" : String(newNumber!))
        Button("Roll", action: rollDice)
    }
    func rollDice() {
        newNumber = Int.random(in: 1...6)
    }
}

#Preview {
    RollDiceView()
}
