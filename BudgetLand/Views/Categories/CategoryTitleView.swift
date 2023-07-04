//
//  CategoryTitleView.swift
//  BudgetLand
//
//  Created by Patka on 28/06/2023.
//

import SwiftUI

struct CategoryTitleView: View {
    var categoryTitle: String
    var categoryColor: String
    var categoryIcon: String
    var body: some View {
        
        ZStack {
            Color(categoryColor)
                .opacity(0.6)
            HStack {
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                        .frame(height: 60)
                    Image(systemName: categoryIcon)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                        .shadow(radius: 5)
                } //zstack
                .frame(alignment: .center)
                .padding()
                Spacer()
                VStack {
                    Text(categoryTitle)
                        .font(.custom(Constants.fontBold, size: 30))
                        .shadow(radius: 0.3)
                    HStack {
                        Text("500")
                            .font(.custom(Constants.fontBold, size: 16))
                        Text("Spent this month")
                            .font(.custom(Constants.fontMedium, size: 16))
                    }
                    .foregroundColor(.black)
                    .shadow(radius: 2)
                } //vstack
                Spacer()
                VStack {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 28)
                        .padding()
                   Spacer()
                }// vstack
                .frame(alignment: .top)
            } // hstack
        }
        .frame(height: 100)
    }
}

struct CategoryTitleView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryTitleView(categoryTitle: "Food", categoryColor: Constants.customBlue, categoryIcon: "cart" )
            .previewLayout(.sizeThatFits)
        
    }
}
