//
//  AllExpensesViewModel.swift
//  BudgetLand
//
//  Created by Patka on 27/07/2023.
//

import Foundation

@MainActor final class AllExpensesViewModel: ObservableObject {
    private let persistanceController = CoreDataManager.shared
    
    @Published var allExpenses: [Expenses] = []
    
    init() {
      fetchAllExpenses()
    }
    
    func fetchAllExpenses() {
        allExpenses = persistanceController.fetchExpenses()
        print(allExpenses)
    }
}
