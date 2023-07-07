//
//  ExpenseRow.swift
//  BudgetLand
//
//  Created by Patka on 05/07/2023.
//

import SwiftUI
import FASwiftUI

struct ExpenseRow: View {
    var expense: ExpenseModel
    
    var body: some View {
        HStack (spacing: 20) {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.cyan.opacity(0.6))
                .frame(width: 40, height: 40)
                .overlay {
                    expense.icon
                }
            VStack(alignment: .leading, spacing: 6) {
                Text(expense.merchant)
                    .font(.custom(Constants.fontBold, size: 15))
                    .lineLimit(1)
                Text(expense.category)
                    .font(.custom(Constants.fontLight, size: 12))
                    .opacity(0.7)
                    .lineLimit(1)
                Text(expense.dateParsed, format: .dateTime.day().month().year())
                    .font(.custom(Constants.fontLight, size: 10))
                    .opacity(0.7)
            } //vstack
            Spacer()
            Text(expense.signedAmount, format: .currency(code: "GBP"))
                .foregroundColor(expense.type == ExpenseType.credit.rawValue ? Color.primary: .red)
        } //hstack
        .padding([.top, .bottom], 8)
    }
}

struct ExpenseRow_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseRow(expense: expensePreviewData)
    }
}
