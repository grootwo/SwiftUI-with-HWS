//
//  SetDiceMaxView.swift
//  RollDice
//
//  Created by Groo on 9/2/24.
//

import SwiftUI

struct SetDiceMaxView: View {
    @Binding var isShowingRollDiceView: Bool
    @Binding var maxNumber: Int
    @State private var isShowingErrorMessage = false
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .leading) {
                TextField("Max number of the dice", value: $maxNumber, formatter: NumberFormatter())
                    .font(.largeTitle)
                    .keyboardType(.numberPad)
                if isShowingErrorMessage {
                    Text("Only numbers bigger than 0 is possible")
                        .foregroundStyle(.secondary)
                }
            }
            Spacer()
            Button(action: {
                if maxNumber < 1 {
                    isShowingErrorMessage = true
                } else {
                    isShowingErrorMessage = false
                    isShowingRollDiceView = true
                }
            }, label: {
                Text("Let's Roll")
                    .font(.title)
            })
        }
        .padding()
    }
}

#Preview {
    SetDiceMaxView(isShowingRollDiceView: .constant(false), maxNumber: .constant(6))
}
