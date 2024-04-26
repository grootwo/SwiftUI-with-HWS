//
//  ContentView.swift
//  WeSplit
//
//  Created by Groo on 4/25/24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var people = 2
    let tipPercentages = [0, 5, 15, 20]
    static let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_US")
        return formatter
    }()
    var body: some View {
        Form {
            Section {
                TextField("Amount", value: $checkAmount, formatter: ContentView.currencyFormatter)
                    .keyboardType(.decimalPad)
            }
            Section {
                Text(checkAmount, format: .currency(code: "USD"))
            }
        }
    }
}

#Preview {
    ContentView()
}
