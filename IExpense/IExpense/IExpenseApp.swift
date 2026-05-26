//
//  IExpenseApp.swift
//  IExpense
//
//  Created by Groo on 5/31/24.
//

import SwiftUI

@main
struct IExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Expense.self)
    }
}
