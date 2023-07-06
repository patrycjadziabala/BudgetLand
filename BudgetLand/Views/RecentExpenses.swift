//
//  RecentExpenses.swift
//  BudgetLand
//
//  Created by Patka on 06/07/2023.
//

import SwiftUI
import FASwiftUI

struct RecentExpenses: View {
    @EnvironmentObject var expenseListVM: ExpenseListViewModel
    
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
                        FAText(iconName: "receipt", size: 26)
                    } // hstack
                }
            } //hstack
            .padding()
            .frame(height: 25)
            
            ForEach(Array(expenseListVM.expenses.prefix(5).enumerated()), id: \.element) { index,
                expense in
                ExpenseRow(expense: expense)
                Divider()
                    .opacity(index == 4 ? 0 : 1)
            }
        } //vstack
        .padding()
        .background(Color(Constants.customBlue))
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .shadow(radius: 6)
    }
}

struct RecentExpenses_Previews: PreviewProvider {
    static let expenseListVM: ExpenseListViewModel = {
        let expenseListVM = ExpenseListViewModel()
        expenseListVM.expenses = expenseListPreviewData
        return expenseListVM
    }()
    
    static var previews: some View {
        RecentExpenses()
            .environmentObject(expenseListVM)
    }
}
