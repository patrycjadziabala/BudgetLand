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
            ZStack {
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
                Color(Constants.customBlue)
                    .opacity(0.25)
                .navigationTitle(Constants.settings)
            } //ztack
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
