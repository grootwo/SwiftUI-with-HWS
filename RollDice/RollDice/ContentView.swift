//
//  ContentView.swift
//  RollDice
//
//  Created by Groo on 9/2/24.
//

import SwiftUI

struct ContentView: View {
    @State private var maxNumber: Int = 6
    @State private var newNumber: Int? = nil
    @State private var isShowingRollDiceView = false
    var body: some View {
        if isShowingRollDiceView {
            RollDiceView(isShowingRollDiceView: $isShowingRollDiceView, newNumber: $newNumber)
        } else {
            SetDiceMaxView(isShowingRollDiceView: $isShowingRollDiceView, maxNumber: $maxNumber)
        }
    }
}

#Preview {
    ContentView()
}
