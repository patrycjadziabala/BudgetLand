////
////  MainViewModel.swift
////  BudgetLand
////
////  Created by Patka on 10/07/2023.
////
//
//import Foundation
//
//final class MainViewModel: ObservableObject {
////    private let persistanceController = PersistenceController.shared
//
//   // properties with data for views
//
//    init() {
//        // Fetching data
//    }
//    func saveExpense(date: Date, type: ExpenseType, amount: Double, description: String) {
//        if description.isEmpty {
//            persistanceController.saveExpense(date: date, amount: amount, type: type, description: "Expense")
//        } else {
//            persistanceController.saveExpense(date: date, amount: amount, type: type, description: description)
//        }
//        let data = persistanceController.fetchExpenses()
//        print(data)
//    }
//    // fetching methods and data manipulation
//}
