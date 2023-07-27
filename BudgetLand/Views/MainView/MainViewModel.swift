//
//  MainViewModel.swift
//  BudgetLand
//
//  Created by Patka on 10/07/2023.
//

import Foundation

final class MainViewModel: ObservableObject {
    private let persistanceController = CoreDataManager.shared
    
    @Published var expensesShortlist: [Expenses] = []
    
    // properties with data for views
    
    init() {
        addDefaultCategoriesToDatabase()
        fetchExpenseForShortlist()
    }
    
    func saveExpense(date: Date, type: ExpenseType, amount: Double, title: String) {
        if title.isEmpty {
            persistanceController.saveExpense(date: date, amount: amount, type: type, title: "Expense")
        } else {
            persistanceController.saveExpense(date: date, amount: amount, type: type, title: title)
        }
        fetchExpenseForShortlist()
    }
    
    func fetchExpenseForShortlist() {
        expensesShortlist = persistanceController.fetchExpenses()
        expensesShortlist = Array(expensesShortlist.suffix(5))
    }
    
    func addDefaultCategoriesToDatabase() {
        if UserDefaults.standard.bool(forKey: "DefaultCategoriesSet") == true {
            return
        } else {
            for category in customCategories {
                let cat = BudgetCategory(context: persistanceController.viewContext)
                cat.id = UUID()
                cat.name = category.name
                cat.amount = category.amount
                cat.color = category.color
                cat.icon = category.icon
            }
            UserDefaults.standard.set(true, forKey: "DefaultCategoriesSet")
        }
    }
    
    // fetching methods and data manipulation
}
