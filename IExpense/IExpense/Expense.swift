//
//  Expense.swift
//  IExpense
//
//  Created by Groo on 7/5/24.
//

import Foundation
import SwiftData

@Model
class Expense: Identifiable{
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
    let currencyCode: String
    
    init(name: String, type: String, amount: Double, currencyCode: String) {
        self.name = name
        self.type = type
        self.amount = amount
        self.currencyCode = currencyCode
    }
}
