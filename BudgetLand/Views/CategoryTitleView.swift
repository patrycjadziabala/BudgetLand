//
//  CategoryTitleView.swift
//  BudgetLand
//
//  Created by Patka on 28/06/2023.
//

import SwiftUI

struct CategoryTitleView: View {
    var categoryTitle: String
    var body: some View {
        Text(categoryTitle)
            .font(.custom(Constants.fontBold, size: 30))
    }
}

struct CategoryTitleView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryTitleView(categoryTitle: "Food")
    }
}
