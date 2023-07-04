//
//  MainView.swift
//  BudgetLand
//
//  Created by Patka on 27/06/2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ScrollView {
            ZStack {
                Color(Constants.customBlue)
                VStack (spacing: 40) {
                    HeaderForMainView()
                        .padding()
                        .frame(height: 350)
                    CategoriesCardView()
                } //v stack
            } // z stack
            .background(Color(Constants.customPink))
            
        } // scroll view
        .ignoresSafeArea()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
