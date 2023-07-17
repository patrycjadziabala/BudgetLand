//
//  SettingsView.swift
//  BudgetLand
//
//  Created by Patka on 12/07/2023.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
                List {
                    NavigationLink {
                        ManageCategoriesView()
                    } label: {
                        Text(Constants.manageCategories)
                    }
                    Button(role: .destructive) {
                    } label: {
                        Text(Constants.clearData)
                    }
                } //list
                .navigationTitle(Constants.settings)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
