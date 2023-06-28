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
                    ZStack {
                        Image(Constants.categoryBackgroundColor)
                            .resizable()
                            .scaledToFit()
                            .shadow(radius: 15)
                            .frame(height: 350)
                            .opacity(0.3)
                        VStack (alignment: .center, spacing: 10) {
                            HStack {
                                CategoryTitleView(categoryTitle: category.title, color: .white)
                                    .shadow(radius: 4)
                                Image(systemName: category.icon)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 30)
                                    .shadow(radius: 5)
                            } //hstack
                        } //vstack
                    } //zstack
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
        } //vstack
        .frame(height: 350)
    }
}

struct CategoriesCardView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesCardView()
    }
}
