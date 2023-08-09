//
//  RecentExpenses.swift
//  BudgetLand
//
//  Created by Patka on 06/07/2023.
//

import SwiftUI

struct RecentExpenses: View {
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Recent")
                    .font(.custom(Constants.fontBold, size: 30))
                    .shadow(radius: 0.3)
                Spacer()
                
            } //hstack
            .padding()
            .frame(height: 25)
           
            ForEach(viewModel.expensesShortlist,id: \.id) { expense in
                ExpenseRow(description: expense.expenseTitle ?? "", expenseType: expense.expenseType, expenseDate: expense.expenseDate ?? Date(), amount: expense.expenseAmount)
            }
        } //vstack
        .padding()
        .background(Color(Constants.customBlue))
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .shadow(radius: 6)
    }
}

struct RecentExpenses_Previews: PreviewProvider {
//    static let expenseListVM: ExpenseListViewModel = {
//        let expenseListVM = ExpenseListViewModel()
//        expenseListVM.expenses = expenseListPreviewData
//        return expenseListVM
//    }()
    
    static var previews: some View {
        RecentExpenses()
//            .environmentObject(expenseListVM)
    }
}
