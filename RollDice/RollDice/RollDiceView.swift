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
    @State private var rollCount = 0
    @State private var totalNumber = 0
    var body: some View {
        VStack {
            Text("Total: \(totalNumber) / Roll Count: \(rollCount)")
                .font(.title)
            Spacer()
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
            Spacer()
        }
    }
    func rollDice() {
        newNumber = Int.random(in: 1...6)
        rollCount += 1
        totalNumber += newNumber!
    }
}

#Preview {
    RollDiceView(isShowingRollDiceView: .constant(true), newNumber: .constant(6))
}
