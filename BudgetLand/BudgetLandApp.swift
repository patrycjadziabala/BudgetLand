//
//  BudgetLandApp.swift
//  BudgetLand
//
//  Created by Patka on 27/06/2023.
//

import SwiftUI

@main
struct BudgetLandApp: App {
   @StateObject var expensesListVM = ExpenseListViewModel()
    
    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environmentObject(expensesListVM)
        }
    }
}
