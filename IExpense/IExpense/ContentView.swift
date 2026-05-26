//
//  ContentView.swift
//  IExpense
//
//  Created by Groo on 5/31/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [Expense]
    @State private var sortOrder = [SortDescriptor(\Expense.amount)]
    @State private var showingType = ["Personal", "Business"]
    var body: some View {
        NavigationStack {
            ExpenseListView(showingType: showingType, sortOrder: sortOrder)
                .navigationTitle("iExpense")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink {
                            AddView()
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                    ToolbarItem(placement: .topBarLeading) {
                        Menu("Sort", systemImage: "arrow.up.arrow.down") {
                            Picker("Sort", selection: $sortOrder) {
                                Text("Sort by price")
                                    .tag([SortDescriptor(\Expense.amount), SortDescriptor(\Expense.name)])
                                Text("Sort by name")
                                    .tag([SortDescriptor(\Expense.name), SortDescriptor(\Expense.amount)])
                            }
                        }
                    }
                    ToolbarItem(placement: .topBarLeading) {
                        Menu("Filter", systemImage: "line.3.horizontal.decrease") {
                            Picker("Filter", selection: $showingType) {
                                Text("All")
                                    .tag(["Personal", "Business"])
                                Text("Only Personal")
                                    .tag(["Personal"])
                                Text("Only Business")
                                    .tag(["Business"])
                            }
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
