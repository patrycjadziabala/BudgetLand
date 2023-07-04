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
                    VStack {
                        VStack (alignment: .center, spacing: 10) {
                            let titleBackgroundColor = colors.randomElement()
                                CategoryTitleView(categoryTitle: category.title, categoryColor: titleBackgroundColor ?? Constants.customBlue, categoryIcon: "cart")
                                    .shadow(radius: 4)
                                    .frame(alignment: .top)
                            Image(Constants.categoryBackgroundColor)
                                .resizable()
                                .scaledToFit()
                                .shadow(radius: 15)
                                .opacity(0.3)
                        } //vstack
                    } //zstack
                    .frame(height: 350)
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
            .frame(width: 350, height: 300)
        } //vstack
    }
}

struct CategoriesCardView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesCardView()
    }
}
