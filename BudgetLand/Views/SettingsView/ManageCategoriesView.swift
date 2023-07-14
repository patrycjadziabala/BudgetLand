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
    
    func addCategory() {
        if newCategory.count > 0  {
            categories.append(Category(
                title: newCategory,
                color: newCategoryColor,
                icon: icon))
            newCategory = ""
        } else {
            isAlertShowing = true
        }
    }
    
    func deleteCategory(at offsets: IndexSet) {
        categories.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(categories, id: \.self) { category in
                        HStack {
                            Image(systemName: category.icon)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 20)
                                .foregroundColor(category.color)
                                .padding(10)
                            Text(category.title)
                                .swipeActions(allowsFullSwipe: false) {
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
                Color(Constants.customBlue)
                    .opacity(0.25)
                    .ignoresSafeArea()
                HStack (spacing: 5) {
                    TextField(Constants.newCategory, text: $newCategory)
                        .padding()
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.default)
                        .submitLabel(.continue)
                        .onSubmit {
                            addCategory()
                        }
                    if newCategory.count > 0 {
                        Button {
                            newCategory = ""
                        } label: {
                            Label(Constants.newCategory, systemImage: Constants.clearIcon)
                                .labelStyle(.iconOnly)
                        } // button
                    }
                    Button(action: {
                        iconPickerPresented = true
                    })
                    {
                        Image(systemName: icon)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 20)
                    }
                    .sheet(isPresented: $iconPickerPresented) {
                        SymbolPicker(symbol: $icon)
                    }
                    ColorPicker("Color Picker", selection: $newCategoryColor)
                        .labelsHidden()
                        .padding()
                    Button {
                        addCategory()
                    } label: {
                        Image(systemName: Constants.addIcon)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 40)
                    } //button "add categories"
                } //hstack
                .padding(.horizontal, 16)
                .shadow(radius: 2)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .alert("Enter Category Title and/or choose an icon)", isPresented: $isAlertShowing) {
                    Button("OK", role: .cancel) {
                        isAlertShowing = false
                    }
                }
            } //zstack
            .navigationTitle(Constants.manageCategories)
            .background()
            .foregroundColor(Color(Constants.customDarkBlue))
            .toolbar(.hidden, for: .tabBar)
        } // navigationView
    }
}

struct ManageCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        ManageCategoriesView()
    }
}
