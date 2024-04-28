//
//  ContentView.swift
//  WeSplit
//
//  Created by Groo on 4/25/24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 0
    @FocusState private var isAmountFocused: Bool
    let tipPercentages = [0, 5, 10, 15, 20]
    var totalAmount: Double {
        return checkAmount * (1 + Double(tipPercentage) / 100)
    }
    var totalPerPerson: Double {
        return checkAmount * (1 + Double(tipPercentage) / 100) / Double(numberOfPeople + 2)
    }
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
                        .focused($isAmountFocused)
                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(2..<101) {
                            Text("\($0) people")
                        }
                    }
                }
                Section("How much do you want to tip?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                Section("Total amount") {
                    Text(totalAmount, format: .currency(code: "USD"))
                }
                Section("Amount per person") {
                    Text(totalPerPerson, format: .currency(code: "USD"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if isAmountFocused {
                    Button("Done") {
                        isAmountFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
