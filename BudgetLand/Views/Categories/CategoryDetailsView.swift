//
//  CategoryDetailsView.swift
//  BudgetLand
//
//  Created by Patka on 28/06/2023.
//

import SwiftUI

struct CategoryDetailsView: View {
    var category: Category
    var body: some View {
        Text(category.name)
    }
}

struct CategoryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailsView(category: customCategories[2])
    }
}
