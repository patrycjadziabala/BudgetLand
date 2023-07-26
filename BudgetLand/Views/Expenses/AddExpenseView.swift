//
//  AddExpenseView.swift
//  BudgetLand
//
//  Created by Patka on 10/07/2023.
//

import SwiftUI

struct AddExpenseView: View {
//    @EnvironmentObject var viewModel: MainViewModel
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) var dismiss
   @ObservedObject var budgetCategory: BudgetCategory
    @State private var expenseDate: Date = Date()
    @State private var expenseAmount: String = ""
    @State private var expenseCategory: ExpenseType = .bills
    @State private var expenseTitle: String = ""
    @State private var currency: Currency = .PLN
    @State private var recurrence: Recurrence = .none
   
    private var isFormValid: Bool {
        !expenseTitle.isEmpty && !expenseTitle.isEmpty && expenseAmount.isNumeric && expenseAmount.isGreaterThan(0)
    }
    
    private func saveExpense() {
        let expense = Expenses(context: viewContext)
        expense.expenseTitle = expenseTitle
        expense.expenseAmount = Double(expenseAmount)!
        
        budgetCategory.addToExpenses(expense)
        try? viewContext.save()
    }
    
    var body: some View {
        ZStack {
            Color(Constants.customGreen)
                .ignoresSafeArea()
            ScrollView {
                VStack (spacing: 10) {
                    Text("Add expense")
                        .font(.custom(Constants.fontExtraBold, size: 30))
                        .foregroundColor(Color(Constants.customDarkBlue))
                        .shadow(radius: 6)
                    Spacer()
                    VStack (spacing: 10) {
                        Text("Selected date:")
                            .font(.custom(Constants.fontMedium, size: 25))
                            .shadow(radius: 2)
                        DatePicker("Selected Date", selection: $expenseDate, displayedComponents: .date)
                            .shadow(radius: 5)
                            .labelsHidden()
                            .accentColor(Color(Constants.customDarkBlue))
                            .colorInvert()
                            .colorMultiply(Color(Constants.customDarkBlue))
                            .background(Color(Constants.customBlue).opacity(0.6))
                            .cornerRadius(90)
                    } //vstack
                        Picker(selection: $currency, label: Text("")) {
                            Text("PLN").tag(Currency.PLN)
                            Text("GBP").tag(Currency.GBP)
                            Text("EUR").tag(Currency.EUR)
                            Text("USD").tag(Currency.USD)
                        } //picker
                        .pickerStyle(.segmented)
                        .padding()
                    HStack {
                        Text("Recurrence")
                        Spacer()
                        Picker("", selection: $recurrence) {
                                Text("None").tag(Recurrence.none)
                                Text("Daily").tag(Recurrence.daily)
                                Text("Weekly").tag(Recurrence.weekly)
                                Text("Monthly").tag(Recurrence.monthly)
                                Text("Yearly").tag(Recurrence.yearly)
                        } //picker
                    } //hstack
                    .padding()
                    TextField("Enter amount", text: $expenseAmount)
    //                .keyboardType(.numberPad)
                    .background(
                        Color.white
                        .cornerRadius(20)
                        .frame(height: 50)
                    )
                    .padding()
                    TextField("Expense title", text: $expenseTitle)
                        .background(
                            Color.white.cornerRadius(20)
                                .frame(height: 50)
                        )
                    .padding()
                    
                    
                    Picker("", selection: $expenseCategory) {
                        ForEach(ExpenseType.allCases, id: \.self) { expense in
                            Text(expense.rawValue)
                        } // for each
                    } //picker
                    .pickerStyle(.wheel)
                    .colorInvert()
                    .colorMultiply(Color(Constants.customDarkBlue))
                    .shadow(radius: 6)
                    Button {
                        saveExpense()
    //                    viewModel.saveExpense(date: expenseDate, type: expenseCategory, amount: expenseAmount ?? 0, description: description)
                        dismiss()
                    } label: {
                        Image(systemName: "checkmark.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 70)
                            .foregroundColor(isFormValid ? Color(Constants.customDarkBlue).opacity(0.8) : Color(uiColor: .gray))
                    } //button
                    .disabled(!isFormValid)
                }
            } //vstack
        } //zstack
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView(budgetCategory: .init())
    }
}
