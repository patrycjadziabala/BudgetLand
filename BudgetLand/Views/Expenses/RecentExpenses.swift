//
//  RecentExpenses.swift
//  BudgetLand
//
//  Created by Patka on 06/07/2023.
//

import SwiftUI

struct RecentExpenses: View {
    @StateObject var viewModel = RecentExpensesViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text("Recent")
                    .font(.custom(Constants.fontBold, size: 30))
                    .shadow(radius: 0.3)
                Spacer()
                NavigationLink {
                } label: {
                    HStack(spacing: 4) {
                        Text("See All")
                        
                    } // hstack
                }
            } //hstack
            .padding()
            .frame(height: 25)
            ForEach(viewModel.allExpenses, id: \.id) { expense in
                ExpenseRow(description: expense.expenseDescription ?? "", expenseType: expense.type, expenseDate: expense.expenseDate ?? Date(), amount: expense.expenseAmount)
            }
            
//            ForEach(Array(expenseListVM.expenses.prefix(5).enumerated()), id: \.element) { index,
//                expense in
//                ExpenseRow(expense: expense)
//                Divider()
//                    .opacity(index == 4 ? 0 : 1)
//            }
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
