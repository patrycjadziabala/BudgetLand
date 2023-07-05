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
             
                VStack (spacing: 40) {
                    HeaderForMainView()
                    CategoriesCardView()
                } //v stack
            } // z stack
      
        } // scroll view
        .ignoresSafeArea()
        .background(Color(Constants.customBlue))
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
