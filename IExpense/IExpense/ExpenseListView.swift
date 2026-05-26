//
//  ExpenseListView.swift
//  IExpense
//
//  Created by Groo on 7/5/24.
//

import SwiftUI
import SwiftData

struct ExpenseListView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [Expense]
    var body: some View {
        List {
            ForEach(expenses) { expense in
                HStack {
                    VStack(alignment: .leading) {
                        Text(expense.name)
                            .font(.headline)
                        Text(expense.type)
                            .font(.subheadline)
                    }
                    Spacer()
                    Text(expense.amount, format: .currency(code: expense.currencyCode))
                        .foregroundStyle(expense.amount < 10 ? .black.opacity(0.3) : (expense.amount < 100 ? .black.opacity(0.6) : .black))
                }
                .accessibilityElement()
                .accessibilityLabel("\(expense.name), \(expense.amount)")
                .accessibilityHint("\(expense.type)")
            }
            .onDelete(perform: { indexSet in
                deleteExpense(at: indexSet)
            })
        }
    }
    
    init(showingType: [String], sortOrder: [SortDescriptor<Expense>]) {
        _expenses = Query(filter: #Predicate<Expense> { expense in
            showingType.contains(expense.type)
        }, sort: sortOrder)
    }
    
    func deleteExpense(at offsets: IndexSet) {
        for offset in offsets {
            let expense = expenses[offset]
            modelContext.delete(expense)
        }
    }}

#Preview {
    ExpenseListView(showingType: ["Personal", "Business"], sortOrder: [SortDescriptor(\Expense.amount)])
}
