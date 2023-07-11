//
//  RecentExpensesViewModel.swift
//  BudgetLand
//
//  Created by Patka on 11/07/2023.
//

import Foundation

@MainActor final class RecentExpensesViewModel: ObservableObject {
   @Published var allExpenses: [Expenses] = []
    private let persistenceConstroller = PersistenceController.shared
    
    init() {
        fetchAllExpenses()
    }
    
    func fetchAllExpenses() {
        allExpenses = persistenceConstroller.fetchExpenses()
        print(allExpenses)
    }
}
