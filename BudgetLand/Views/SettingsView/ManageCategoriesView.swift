//
//  ManageCategoriesView.swift
//  BudgetLand
//
//  Created by Patka on 13/07/2023.
//

import SwiftUI

struct ManageCategoriesView: View {
    var body: some View {
        NavigationView {
            List {
                Text("Food")
                Text("Subscriptions")
                Text("Bills")
                Spacer()
                HStack {
                    
                }
            }
            
            .navigationTitle(Constants.manageCategories)
        }
    }
}

struct ManageCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        ManageCategoriesView()
    }
}
