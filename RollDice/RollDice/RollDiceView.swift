//
//  RollDiceView.swift
//  RollDice
//
//  Created by Groo on 9/2/24.
//

import SwiftUI

struct RollDiceView: View {
    @Binding var isShowingRollDiceView: Bool
    @Binding var newNumber: Int?
    var body: some View {
        Button(action: {
            rollDice()
        }, label: {
            Text(newNumber == nil ? "?" : String(newNumber!))
                .font(.largeTitle)
                .padding(50)
                .background(.white)
                .clipShape(Circle())
                .shadow(radius: 5)
        })
    }
    func rollDice() {
        newNumber = Int.random(in: 1...6)
    }
}

#Preview {
    RollDiceView(isShowingRollDiceView: .constant(true), newNumber: .constant(6))
}
