//
//  Persistence+Expence.swift
//  BudgetLand
//
//  Created by Patka on 10/07/2023.
//

import Foundation
import CoreData

//extension PersistenceController {
//    func saveExpense(date: Date, amount: Double, type: ExpenseType, description: String) {
//        let expense = Expenses(context: viewContext)
//        
//        expense.id = UUID()
//        expense.expenseAmount = amount
//        expense.expenseDate = date
//        expense.expenseType = type
//        expense.expenseDescription = description
//        
//        save()
//    }
//    
//    func fetchExpenses() -> [Expenses] {
//        let request = NSFetchRequest<Expenses>(entityName: "Expenses")
//        
//        do {
//            let expenses = try viewContext.fetch(request)
//            return expenses
//        } catch let error {
//            print("Error fetching expenses \(error.localizedDescription)")
//            return []
//        }
//    }
//}
