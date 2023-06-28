//
//  MainView.swift
//  BudgetLand
//
//  Created by Patka on 27/06/2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            Color(Constants.customBlue)
            VStack {
                Text("Dashboard")
                    .font(.custom(Constants.fontExtraBold, size: 40))
                Text("1,500.00")
                    .font(.custom(Constants.fontMedium, size: 30))
                    .foregroundColor(.white)
                    .shadow(radius: 4)
                Text("Total spent this month so far")
                
                CategoriesCardView()
            } //v stack
        } // z stack
        .background(Color(Constants.customPink))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
