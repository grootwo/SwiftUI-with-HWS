//
//  ContentView.swift
//  HotProspects
//
//  Created by Groo on 7/29/24.
//

import SwiftUI
import SamplePackage

struct ContentView: View {
    let numbers = 1...100
    var result: String {
        let selectedNumbers = numbers.random(5).sorted()
        let strings = selectedNumbers.map(String.init)
        return strings.formatted()
    }
    var body: some View {
        Text(result)
    }
}

#Preview {
    ContentView()
}
