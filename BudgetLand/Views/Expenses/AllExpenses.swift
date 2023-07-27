//
//  AllExpenses.swift
//  BudgetLand
//
//  Created by Patka on 18/07/2023.
//

import SwiftUI

struct AllExpenses: View {
    @StateObject var viewModel = AllExpensesViewModel()
    @State private var timePeriodFilter: Recurrence = .monthly
    @State private var searchText: String = ""
    @State private var currency: Currency = .GBP
    
    var body: some View {
        
        NavigationView(content: {
            ScrollView {
                VStack (spacing: 10) {
                    Text(searchText)
                    HStack {
                        Text(Constants.totalFor)
                            .font(.custom(Constants.fontBold, size: 20))
                        Picker("", selection: $timePeriodFilter, content: {
                            Text(Constants.today)
                            Text(Constants.thisWeek)
                            Text(Constants.thisMonth)
                            Text(Constants.thisYear)
                        })
                        .pickerStyle(.menu)
                        .navigationTitle(Constants.allExpenses)
                    } //hstack
                    HStack {
                        TotalExpensesInCurrency()
                        Spacer()
                        TotalExpensesInCurrency()
                        Spacer()
                        TotalExpensesInCurrency()
                    } //hstack
                    .padding()
                    Spacer()
                    ForEach(viewModel.allExpenses, id: \.id) { expense in
                        ExpenseRow(description: expense.expenseTitle ?? "", expenseType: expense.expenseType, expenseDate: expense.expenseDate ?? Date(), amount: expense.expenseAmount)
                    }
                } //vstack
                .searchable(text: $searchText)
                .onAppear() {
                    viewModel.fetchAllExpenses()
                }
            }
        })
        .foregroundColor(Color(Constants.customDarkBlue))
        //        .background(ignoresSafeAreaEdges: .all)
    }
    

}

struct AllExpenses_Previews: PreviewProvider {
    static var previews: some View {
        AllExpenses()
    }
}
