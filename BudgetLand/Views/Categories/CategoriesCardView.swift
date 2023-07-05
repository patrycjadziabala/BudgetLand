//
//  CategoriesCardView.swift
//  BudgetLand
//
//  Created by Patka on 27/06/2023.
//

import SwiftUI

struct CategoriesCardView: View {
    @State private var categoryPresented: Category?
   
    var body: some View {
        VStack {
            TabView {
                ForEach(customCategories, id: \.id) {
                    category in
                        VStack (alignment: .center, spacing: 5) {
                            let titleBackgroundColor = colors.randomElement() ?? Constants.customBlue
                                CategoryTitleView(categoryTitle: category.title, categoryColor: titleBackgroundColor, categoryIcon: "cart")
                                    .shadow(radius: 4)
                          Rectangle()
                                .foregroundColor(Color(titleBackgroundColor))
                                .opacity(0.5)
                        } //vstack
                    .cornerRadius(15)
                    .onTapGesture {
                        categoryPresented = category
                    }
                } // for each
                .sheet(item: $categoryPresented) { category in
                    CategoryDetailsView(category: category)
                }
            } // tab view
            .tabViewStyle(.page)
            .frame(height: 300)
            .padding()
        } //vstack
    }
}

struct CategoriesCardView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesCardView()
    }
}
