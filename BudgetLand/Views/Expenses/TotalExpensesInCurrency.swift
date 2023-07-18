//
//  TotalExpensesInCurrency.swift
//  BudgetLand
//
//  Created by Patka on 18/07/2023.
//

import SwiftUI

struct TotalExpensesInCurrency: View {
    var totalAmount: Double = 2.57
    var currency: Currency = .PLN
    
    var body: some View {
        VStack (spacing: 5) {
            Text("\(totalAmount.rounded())")
                .font(.custom(Constants.fontMedium, size: 20))
            Text("\(currency.rawValue)")
                .font(.custom(Constants.fontMedium, size: 18))
        } //vstack
        .frame(maxWidth: 70, maxHeight: 70)
        .padding(15)
        .background(Color(Constants.customGreen))
        .cornerRadius(90)
    }
}

struct TotalExpensesInCurrency_Previews: PreviewProvider {
    static var previews: some View {
        TotalExpensesInCurrency()
    }
}
