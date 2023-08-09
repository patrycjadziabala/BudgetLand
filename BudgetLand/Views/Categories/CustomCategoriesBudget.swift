//
//  CustomCategoriesBudget.swift
//  BudgetLand
//
//  Created by Patka on 01/08/2023.
//

import SwiftUI

struct CustomCategoriesBudget: View {
    var body: some View {
        
        @State var customCategory: Category?
        @State var inEditingMode: Bool = false
        
        ScrollView {
            VStack {
                Text("Set your budgets")
                    .font(.custom(Constants.fontExtraBold, size: 35))
                    .padding()
                ForEach(customCategories) { customCategory in
                    HStack {
                        Text(customCategory.name)
                        Spacer()
                        Text(customCategory.amount as NSNumber, formatter: NumberFormatter.currency)
                            .padding()
                            .onTapGesture {
                                inEditingMode = true
                            }
                    } // hstack
                    .padding()
                    .font(.custom(Constants.fontBold, size: 25))
                } //for each
            } //vstack
        } //scroll view
    }
}

struct CustomCategoriesBudget_Previews: PreviewProvider {
    static var previews: some View {
        CustomCategoriesBudget()
    }
}
