//
//  AddCategoryView.swift
//  BudgetLand
//
//  Created by Patka on 19/07/2023.
//

import SwiftUI
import SymbolPicker

struct AddCategoryView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) private var viewContext
    @State private var isAlertShowing = false
    @State private var newCategoryName: String = ""
    @State private var categoryBudget: String = ""
    @State private var newCategoryColor: Color = Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    @State private var categories: [Category] = customCategories
    @State private var iconPickerPresented = false
    @State private var icon: String = "pencil"
    
    var isFormValid: Bool {
        !newCategoryName.isEmpty && !categoryBudget.isEmpty && categoryBudget.isGreaterThan(0)
    }
    //todo: Save color
    private func addCategory() {
//        if isFormValid == true  {
            let budgetCategory = BudgetCategory(context: viewContext)
            budgetCategory.name = newCategoryName
            budgetCategory.amount = Double(categoryBudget)!
            budgetCategory.icon = icon
            do {
                try viewContext.save()
//                categories.append(Category(
//                    id: UUID(),
//                    name: newCategoryName,
//                    color: newCategoryColor,
//                    icon: icon,
//                    amount: Double(categoryBudget)!))
                dismiss()
            } catch {
                print("Error saving category \(error.localizedDescription)")
            }
            
//            newCategoryName = ""
//            categoryBudget = ""
//        } else {
//            isAlertShowing = true
//        }
    }
    
    var body: some View {
        VStack (spacing: 0) {
            
            Text(Constants.addNewCategory)
                .font(.custom(Constants.fontBold, size: 25))
                .padding()
            // todo: add isFormValid (disable add button or texfield properties -> disable keybord dismiss)??
            Form {
                TextField(Constants.newCategoryName, text: $newCategoryName)
                    .keyboardType(.default)
                    .submitLabel(.continue)
                    .onSubmit {
                        addCategory()
                    }
                TextField(Constants.addCategoryBudget, text: $categoryBudget)
                    .keyboardType(.decimalPad)
            }
            
            HStack {
                Text(Constants.selectCategorySymbol)
                    .font(.custom(Constants.fontMedium, size: 18))
                Spacer()
                Button(action: {
                    iconPickerPresented = true
                })
                {
                    Image(systemName: icon)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 20)
                }
                .popover(isPresented: $iconPickerPresented) {
                    SymbolPicker(symbol: $icon)
                }
            }
            .padding()
            
            HStack {
                Text(Constants.selectColor)
                    .font(.custom(Constants.fontMedium, size: 18))
                Spacer()
                ColorPicker("Color Picker", selection: $newCategoryColor)
                    .labelsHidden()
                    .padding()
            } //hstack
            .padding()
            
            Button {
                if isFormValid {
                    addCategory()
                    dismiss()
                }
            } label: {
                Image(systemName: Constants.addIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 40)
            } //button "add categories"
            .padding()
            .disabled(!isFormValid)
        } //vstack
        .frame(width: 300, height: 500)
        .background(Color(Constants.customPurple))
        .cornerRadius(45)
        .alert("Enter Category Title and Budget", isPresented: $isAlertShowing) {
            Button("OK", role: .cancel) {
                isAlertShowing = false
            }
        }
    }
}

struct AddCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        AddCategoryView()
    }
}
