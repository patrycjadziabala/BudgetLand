//
//  ManageCategoriesView.swift
//  BudgetLand
//
//  Created by Patka on 13/07/2023.
//

import SwiftUI

struct ManageCategoriesView: View {
    @State private var newCategory: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    Text("Food")
                    Text("Subscriptions")
                    Text("Bills")
                    Spacer()
                } // list
                Color(Constants.customBlue)
                    .opacity(0.25)
                    .ignoresSafeArea()
                HStack {
                    TextField(Constants.newCategory, text: $newCategory)
                        .padding()
                        .textFieldStyle(.roundedBorder)
                    if newCategory.count > 0 {
                        Button {
                            newCategory = ""
                        } label: {
                            Label(Constants.newCategory, systemImage: Constants.clearIcon)
                                .labelStyle(.iconOnly)
                                .padding(10)
                        } // button
                    }
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
