//
//  ExpenseModel.swift
//  BudgetLand
//
//  Created by Patka on 05/07/2023.
//

import Foundation
import FASwiftUI

struct ExpenseModel: Identifiable, Decodable, Hashable {
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
    
    var icon: FAText {
        if let expense = Expense.all.first(where: { $0.id == categoryId
        })
        {
            return expense.iconName
        }
        return FAText(iconName: "circle-question", size: 26)
    }
    
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

struct Expense {
    let id: Int
    let name: String
    let iconName: FAText
    var mainCategoryId: Int?
}

extension Expense {
    static let food = Expense(id: 1, name: "Food", iconName: .init(iconName: "bowl-food", size: 26))
    static let transport = Expense(id: 2, name: "Transport", iconName: .init(iconName: "car", size: 26))
    static let bills = Expense(id: 3, name: "Bills", iconName: .init(iconName: "money-bills", size: 26))
    static let holiday = Expense(id: 4, name: "Holiday", iconName: .init(iconName: "suitcase-rolling", size: 26))
    static let health = Expense(id: 5, name: "Health", iconName: .init(iconName: "kit-medical", size: 26))
    static let subscriptions = Expense(id: 6, name: "Subscriptions", iconName: .init(iconName: "arrow-rotate-right", size: 26))
    static let loans = Expense(id: 7, name: "Loans", iconName: .init(iconName: "credit-card", size: 26))
    static let shopping = Expense(id: 8, name: "Shopping", iconName: .init(iconName: "bag-shopping", size: 26))
    static let income = Expense(id: 9, name: "Income", iconName: .init(iconName: "money-bill", size: 26))
    
    static let publicTransport = Expense(id: 101, name: "Public Transport", iconName: .init(iconName: "bus", size: 26), mainCategoryId: 1)
    static let taxi = Expense(id: 102, name: "Taxi", iconName: .init(iconName: "taxi", size: 26))
    static let mobilePhone = Expense(id: 301, name: "Mobile Phone", iconName: .init(iconName: "mobile", size: 26))
    static let movies = Expense(id: 301, name: "Movies", iconName: .init(iconName: "film", size: 26))
    static let bankFee = Expense(id: 401, name: "Bank Fee", iconName: .init(iconName: "sack-dollar", size: 26))
    static let financeCharge = Expense(id: 402, name: "Finance Charge", iconName: .init(iconName: "sack-dollar", size: 26))
    static let groceries = Expense(id: 501, name: "Groceries", iconName: .init(iconName: "bowl-food", size: 26))
    static let restaurants = Expense(id: 502, name: "Restaurants", iconName: .init(iconName: "wine-glass-empty", size: 26))
    static let rent = Expense(id: 601, name: "Rent", iconName: .init(iconName: "house", size: 26))
    
    static let homeSupplies = Expense(id: 602, name: "Home Supplies", iconName: .init(iconName: "couch", size: 26))
    static let paycheque = Expense(id: 701, name: "Paycheque", iconName: .init(iconName: "money-bill-transfer", size: 26))
    static let software = Expense(id: 801, name: "Software", iconName: .init(iconName: "computer", size: 26))
    static let creditCardPayment = Expense(id: 901, name: "Credit Card Payment", iconName: .init(iconName: "credit-card", size: 26))
}

extension Expense {
    static let categories: [Expense] = [
        .food,
        .transport,
        .bills,
        .holiday,
        .health,
        .subscriptions,
        .loans,
        .shopping,
    ]
    
    static let subCategories: [Expense] = [
        .publicTransport,
        .taxi,
        .mobilePhone,
        .movies,
        .bankFee,
        .financeCharge,
        .groceries,
        .restaurants,
        .rent,
        .homeSupplies,
        .paycheque,
        .software,
        .creditCardPayment
    ]
    
    static let all: [Expense] = categories + subCategories
}
