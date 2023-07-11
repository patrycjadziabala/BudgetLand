//
//  ExpenseRow.swift
//  BudgetLand
//
//  Created by Patka on 05/07/2023.
//

import SwiftUI

struct ExpenseRow: View {
    let description: String
    let expenseType: ExpenseType
    let expenseDate: Date
    let amount: Double
    
    
    var body: some View {
        HStack (spacing: 20) {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.cyan.opacity(0.6))
                .frame(width: 40, height: 40)
              
            VStack(alignment: .leading, spacing: 6) {
                Text(description)
                    .font(.custom(Constants.fontBold, size: 15))
                    .lineLimit(1)
                Text(expenseType.rawValue)
                    .font(.custom(Constants.fontLight, size: 12))
                    .opacity(0.7)
                    .lineLimit(1)
                Text(expenseDate.toString())
                    .font(.custom(Constants.fontLight, size: 10))
                    .opacity(0.7)
            } //vstack
            Spacer()
            Text(amount, format: .currency(code: "GBP"))
                .padding()
        } //hstack
        .padding([.top, .bottom], 8)
    }
}

struct ExpenseRow_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseRow(description: "Taxi", expenseType: .transport, expenseDate: Date(), amount: 15)
    }
}
