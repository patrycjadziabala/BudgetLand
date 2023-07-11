//
//  ExpenseModel.swift
//  BudgetLand
//
//  Created by Patka on 05/07/2023.
//

import Foundation

@objc public enum ExpenseType: Int32, CaseIterable {
    
case food
case bills
case transport
case holiday
case health
case subscriptions
case loans
case shopping

public typealias RawValue = String
    
    public init?(rawValue: String) {
        switch rawValue {
        case "food": self = .food
        case "bills": self = .bills
        case "transport": self = .transport
        case "holiday": self = .holiday
        case "health": self = .health
        case "subscriptions": self = .subscriptions
        case "loans": self = .loans
        case "shopping": self = .shopping
        default: self = .food
        }
    }
    
    public var rawValue: RawValue {
        switch self {
        case .food: return "food"
        case .bills: return "bills"
        case .transport: return "transport"
        case .holiday: return "holiday"
        case .health: return "health"
        case .subscriptions: return "subscriptions"
        case .loans: return "loans"
        case .shopping: return "shopping"
        }
    }
    
    public var iconName: String {
        switch self {
        case .food: return Constants.foodIcon
        case .bills: return Constants.billsIcon
        case .transport: return Constants.transportIcon
        case .holiday: return Constants.holidayIcon
        case .health: return Constants.healthIcon
        case .subscriptions: return Constants.subscriptionsIcon
        case .loans: return Constants.loansIcon
        case .shopping: return Constants.shoppingIcon
        }
    }
}







//struct ExpenseModel: Identifiable, Decodable, Hashable {
//    let id: Int
//    let date: String
//    let institution: String
//    let account: String
//    var merchant: String
//    let amount: Double
//    let type: ExpenseType.RawValue
//    var categoryId: Int
//    var category: String
//    let isPending: Bool
//    var isTransfer: Bool
//    var isExpense: Bool
//    var isEdited: Bool
//
//    var dateParsed: Date {
//        date.dateParsed()
//    }
//
//    var signedAmount: Double {
//        return type == ExpenseType.credit.rawValue ? amount : -amount
//    }
//}

//enum ExpenseType: String {
//    case debit = "debit"
//    case credit = "credit"
//}
