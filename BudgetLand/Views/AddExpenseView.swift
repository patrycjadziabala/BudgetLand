//
//  AddExpenseView.swift
//  BudgetLand
//
//  Created by Patka on 10/07/2023.
//

import SwiftUI

struct AddExpenseView: View {
    @EnvironmentObject var viewModel: MainViewModel
    @Environment(\.dismiss) var dismiss
    @State private var expenseDate: Date = Date()
    @State private var expenseAmount: Double?
    @State private var expenseCategory: ExpenseType = .bills
    @State private var description: String = ""
    var body: some View {
        ZStack {
            Color(Constants.customGreen)
                .ignoresSafeArea()
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
                }
                TextField(value: $expenseAmount, format: .number) {
                    Text("Enter amount")
                } // textField
                .keyboardType(.numberPad)
                .background(
                    Color.white
                    .cornerRadius(20)
                    .frame(height: 50)
                    
                )
                .padding()
                TextField("Notes", text: $description, axis: .vertical)
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
                    viewModel.saveExpense(date: expenseDate, type: expenseCategory, amount: expenseAmount ?? 0, description: description)
                    dismiss()
                } label: {
                    Image(systemName: "checkmark.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 70)
                        .foregroundColor(Color(Constants.customDarkBlue))
                } //button
            } //vstack
        } //zstack
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView()
    }
}
