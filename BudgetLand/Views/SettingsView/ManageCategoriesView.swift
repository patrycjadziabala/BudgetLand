//
//  ManageCategoriesView.swift
//  BudgetLand
//
//  Created by Patka on 13/07/2023.
//

import SwiftUI
import SymbolPicker

struct ManageCategoriesView: View {
    @State private var isAlertShowing = false
    @State private var newCategory: String = ""
    @State private var newCategoryColor = Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    @State private var categories: [Category] = customCategories
    @State private var iconPickerPresented = false
    @State private var icon = "pencil"
    @State private var addNewCategoryViewIsShowing: Bool = false
    
    func deleteCategory(at offsets: IndexSet) {
        categories.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Button {
                        addNewCategoryViewIsShowing.toggle()
                    } label: {
                        Text(Constants.addNewCategory)
                            .shadow(radius: 4)
                            .foregroundColor(Color(Constants.customDarkBlue))
                            .background(Color(Constants.customPink))
                    }
                    .popover(isPresented: $addNewCategoryViewIsShowing) {
                        AddCategoryView()
                    }
                    .background(
                        Rectangle()
                            .cornerRadius(45)
                            .padding()
                    )
                    .frame(maxWidth: .infinity)
                    ForEach(categories, id: \.self) { category in
                        HStack {
                            Image(systemName: category.icon)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 20)
                                .foregroundColor(category.color)
                                .padding(10)
                            Text(category.title)
                                .swipeActions(allowsFullSwipe: true) {
                                    Button {
                                        print("Works")
                                    } label: {
                                        Label("Delete Category", systemImage: "trash.fill")
                                    }
                                }
                        }
                    }
                    .onDelete(perform: deleteCategory)
                } // list
                .navigationTitle(Constants.manageCategories)
                .background()
                .foregroundColor(Color(Constants.customDarkBlue))
            } //vstack
        } // navigationView
    }
}

struct ManageCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        ManageCategoriesView()
    }
}
