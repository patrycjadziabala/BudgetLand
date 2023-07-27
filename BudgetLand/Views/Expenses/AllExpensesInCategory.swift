//
//  AllExpensesInCategory.swift
//  BudgetLand
//
//  Created by Patka on 21/07/2023.
//

import SwiftUI

struct AllExpensesInCategory: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject var budgetCategory: BudgetCategory
    @State private var title: String = ""
    @State private var amount: String = ""
    
    private var isFormValid: Bool {
        !title.isEmpty && !amount.isEmpty && amount.isNumeric && amount.isGreaterThan(0)
    }
    
    private func saveExpense() {
        let expense = Expenses(context: viewContext)
        expense.expenseTitle = title
        expense.expenseAmount = Double(amount)!
        
        budgetCategory.addToExpenses(expense)
        try? viewContext.save()
    }
   
    private var expensesArray: [Expenses] {
        guard let expenses = budgetCategory.expenses else {
            return []
        }
       return expenses.allObjects as! [Expenses]
    }
    
    var body: some View {
        
        VStack (alignment: .leading) {
//            List (expensesArray) { expense in
//                Text(expense.description)
//            }
            
            //            Text(budgetCategory.amount as NSNumber, formatter: NumberFormatter.currency)
            //                .frame(maxWidth: .infinity, alignment: .leading)
            //            Spacer()
            Form {
                TextField("Title", text: $title)
                TextField("Amount", text: $amount)
            }
             
            HStack {
                Spacer()
                Button("Add Expense") {
                    saveExpense()
                }
                .disabled(!isFormValid)
                Spacer()
            }
            List(expensesArray) { expense in
                VStack {
                    HStack {
                        Text(expense.expenseTitle ?? "")
                        Spacer()
                        Text(expense.expenseAmount as NSNumber, formatter: NumberFormatter.currency)
                    } //hstack
                    .padding()
                }
            }
        }
        .padding()
        
    }
}

struct AllExpensesInCategory_Previews: PreviewProvider {
    static var previews: some View {
        
        let vc = CoreDataManager.shared.persistentContainer.viewContext
        let request = BudgetCategory.fetchRequest()
        let results = try! vc.fetch(request)

        NavigationStack {
            AllExpensesInCategory(budgetCategory: results[0]).environment(\.managedObjectContext, vc)
        }
    }
}
