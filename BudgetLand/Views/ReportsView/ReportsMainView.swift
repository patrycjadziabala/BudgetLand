//
//  ReportsMainView.swift
//  BudgetLand
//
//  Created by Patka on 12/07/2023.
//

import SwiftUI

struct ReportsMainView: View {
    var body: some View {
        NavigationView {
            Text("Reports")
                .navigationTitle(Constants.reports)
        }
    }
}

struct ReportsMainView_Previews: PreviewProvider {
    static var previews: some View {
        ReportsMainView()
    }
}
