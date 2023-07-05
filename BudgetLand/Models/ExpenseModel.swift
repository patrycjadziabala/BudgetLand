//
//  ExpenseModel.swift
//  BudgetLand
//
//  Created by Patka on 05/07/2023.
//

import Foundation

struct ExpenseModel: Identifiable {
    let id: Int
    let date: String
    let institution: String
    let account: String
    var merchant: String
    let amount: Double
    let type: ExpenseType.RawValue
    var categoryId: Int
    var category: String
    let isPending: Bool
    var isTransfer: Bool
    var isExpense: Bool
    var isEdited: Bool
    
    var dateParsed: Date {
        date.dateParsed()
    }
    
    var signedAmount: Double {
        return type == ExpenseType.credit.rawValue ? amount : -amount
    }
}

enum ExpenseType: String {
    case debit = "debit"
    case credit = "credit"
}
