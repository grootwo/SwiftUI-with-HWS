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
        Button(action: {
            rollDice()
        }, label: {
            Text(newNumber == nil ? "?" : String(newNumber!))
                .font(.largeTitle)
                .foregroundStyle(.black)
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
    RollDiceView()
}
