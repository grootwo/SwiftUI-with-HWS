//
//  ContentView.swift
//  WeSplit
//
//  Created by Groo on 4/25/24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    let tipPercentages = [0, 5, 15, 20]
    static let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_US")
        return formatter
    }()
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, formatter: ContentView.currencyFormatter)
                        .keyboardType(.decimalPad)
                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(2..<101) {
                            Text("\($0) people")
                        }
                    }
                }
                Section {
                    Text(checkAmount, format: .currency(code: "USD"))
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

#Preview {
    ContentView()
}
