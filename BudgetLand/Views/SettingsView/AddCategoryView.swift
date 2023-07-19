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
    @State private var isAlertShowing = false
    @State private var newCategoryName: String = ""
    @State private var newCategoryColor = Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    @State private var categories: [Category] = customCategories
    @State private var iconPickerPresented = false
    @State private var icon: String = "pencil"
    @State private var categoryBudget: Double?
    
    func addCategory() {
        if newCategoryName.count > 0  {
            categories.append(Category(
                id: UUID(),
                title: newCategoryName,
                color: newCategoryColor,
                icon: icon))
            newCategoryName = ""
        } else {
            isAlertShowing = true
        }
    }
    
    var body: some View {
        VStack (spacing: -20) {
            Text(Constants.addNewCategory)
                .font(.custom(Constants.fontBold, size: 25))
                .padding()
            TextField(Constants.newCategoryName, text: $newCategoryName)
                .padding()
                .textFieldStyle(.roundedBorder)
                .keyboardType(.default)
                .submitLabel(.continue)
                .onSubmit {
                    addCategory()
                }
            if newCategoryName.count > 0 {
                Button {
                    newCategoryName = ""
                    categoryBudget = 0
                } label: {
                    Label(Constants.newCategoryName, systemImage: Constants.clearIcon)
                        .labelStyle(.iconOnly)
                } // button
            }
            TextField(value: $categoryBudget, format: .number) {
                Text(Constants.addCategoryBudget)
            } // textField
            .keyboardType(.numberPad)
            .textFieldStyle(.roundedBorder)
            .padding()
            
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
                addCategory()
                dismiss()
            } label: {
                Image(systemName: Constants.addIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 40)
            } //button "add categories"
            .padding()
        } //vstack
        .frame(width: 300, height: .infinity)
        .background(Color(Constants.customPurple))
        .cornerRadius(45)
        .alert("Enter Category Title and/or choose an icon)", isPresented: $isAlertShowing) {
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
