//
//  ManageCategoriesView.swift
//  BudgetLand
//
//  Created by Patka on 13/07/2023.
//

import SwiftUI

struct ManageCategoriesView: View {
    @State private var newCategory: String = ""
    @State private var newCategoryColor = Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    @State private var categories: [Category] = customCategories
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(categories) { category in
                        HStack {
                            Image(systemName: category.icon)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 20)
                                .foregroundColor(category.color)
                                .padding(10)
                            Text(category.title)
                        }
                    }
                    Spacer()
                } // list
                Color(Constants.customBlue)
                    .opacity(0.25)
                    .ignoresSafeArea()
                HStack (spacing: 5) {
                    TextField(Constants.newCategory, text: $newCategory)
                        .padding()
                        .textFieldStyle(.roundedBorder)
                    if newCategory.count > 0 {
                        Button {
                            newCategory = ""
                        } label: {
                            Label(Constants.newCategory, systemImage: Constants.clearIcon)
                                .labelStyle(.iconOnly)
                        } // button
                    }
                        ColorPicker("Color Picker", selection: $newCategoryColor)
                            .labelsHidden()
                            .padding()
                        Button {
                            
                        } label: {
                            Image(systemName: Constants.addIcon)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 40)
                        } //button
                } //hstack
                .padding(.horizontal, 16)
                .shadow(radius: 2)
                .frame(maxHeight: .infinity, alignment: .bottom)
            } //zstack
            .navigationTitle(Constants.manageCategories)
            .background()
            .foregroundColor(Color(Constants.customDarkBlue))
        } // navigationView
    }
}

struct ManageCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        ManageCategoriesView()
    }
}
