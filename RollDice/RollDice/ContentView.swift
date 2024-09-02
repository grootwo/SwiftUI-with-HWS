//
//  ContentView.swift
//  RollDice
//
//  Created by Groo on 9/2/24.
//

import SwiftUI

struct ContentView: View {
    @State private var maxNumber: Int? = nil
    var body: some View {
        SetDiceMaxView()
    }
}

#Preview {
    ContentView()
}
