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
    @State private var rollCount = UserDefaults.standard.integer(forKey: "RollCount")
    @State private var totalNumber = UserDefaults.standard.integer(forKey: "TotalNumber")
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
        UserDefaults.standard.set(rollCount, forKey: "RollCount")
        totalNumber += newNumber!
        UserDefaults.standard.set(totalNumber, forKey: "TotalNumber")
    }
}

#Preview {
    RollDiceView(isShowingRollDiceView: .constant(true), newNumber: .constant(6))
}
