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
    //    @State private var iconPickerPresented = false
    @State private var icon = "pencil"
    @State private var addNewCategoryViewIsShowing: Bool = false
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) private var budgetCategoryResults: FetchedResults<BudgetCategory>
    
    func deleteCategory(at offsets: IndexSet) {
        categories.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List(budgetCategoryResults) { budgetCategory in
                    NavigationLink(value: budgetCategory) {
                        HStack {
                            Image(systemName: budgetCategory.icon ?? "pencil")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 20)
                            //  .foregroundColor(category.color)
                                .padding(10)
                            Text(budgetCategory.name ?? "")
                                .swipeActions(allowsFullSwipe: true) {
                                    Button {
                                        print("Works")
                                    } label: {
                                        Label("Delete Category", systemImage: "trash.fill")
                                    }
                                }
                            Spacer()
                            Text(budgetCategory.amount as NSNumber, formatter: NumberFormatter.currency)
                        }
                    }
                    
                    //                    }
                    //                    .onDelete(perform: deleteCategory)
                } // list
                .navigationTitle(Constants.manageCategories)
                .navigationDestination(for: BudgetCategory.self, destination: { budgetCategory in
                    AllExpensesInCategory(budgetCategory: budgetCategory)
                })
                .background()
                .foregroundColor(Color(Constants.customDarkBlue))
            } //vstack
        } // navigationView
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    addNewCategoryViewIsShowing = true
                } label: {
                    Text(Constants.addNewCategory)
                        .shadow(radius: 4)
                        .foregroundColor(Color(Constants.customDarkBlue))
                }
                .popover(isPresented: $addNewCategoryViewIsShowing) {
                    AddCategoryView()
                }
            }
        }
    }
}

struct ManageCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ManageCategoriesView()
        }
    }
}
