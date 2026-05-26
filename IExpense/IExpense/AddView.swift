//
//  AddView.swift
//  IExpense
//
//  Created by Groo on 6/1/24.
//

import SwiftUI

struct AddView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_US")
        return formatter
    }()
    @State private var currencyLocale = "USD"
    let currencyLocales = ["USD", "EUR", "KRW"]
    @State private var name = "Expense's name"
    @State private var amount = 0.0
    @State private var type = "Personal"
    let types = ["Personal", "Business"]
    var body: some View {
        NavigationStack {
            Form {
                Picker("type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                Picker("currency", selection: $currencyLocale) {
                    ForEach(currencyLocales, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                .onChange(of: currencyLocale) { oldValue, newValue in
                    if newValue == "USD" {
                        currencyFormatter.locale = Locale(identifier: "en_US")
                    } else if newValue == "EUR" {
                        currencyFormatter.locale = Locale(identifier: "fr_FR")
                    } else {
                        currencyFormatter.locale = Locale(identifier: "ko_KR")
                    }
                }
                TextField("amount", value: $amount, formatter: currencyFormatter)
                    .keyboardType(.decimalPad)
            }
            .toolbar {
                Button("Save") {
                    let expense = Expense(name: name, type: type, amount: amount, currencyCode: currencyLocale)
                    modelContext.insert(expense)
                    dismiss()
                }
            }
            .navigationBarBackButtonHidden()
            .navigationTitle($name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AddView()
}
