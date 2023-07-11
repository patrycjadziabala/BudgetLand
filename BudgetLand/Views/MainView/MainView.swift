//
//  MainView.swift
//  BudgetLand
//
//  Created by Patka on 27/06/2023.
//

import SwiftUI

struct MainView: View {
    @State private var addExpensePresented: Bool = false
    @StateObject var viewModel = MainViewModel()
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
        .overlay(alignment: .bottomTrailing, content: {
            Button {
                addExpensePresented.toggle()
            } label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 90)
                    .padding()
            } // button
            .sheet(isPresented: $addExpensePresented) {
                AddExpenseView()
            }
        })
        .background(Color(Constants.customBlue))
        .environmentObject(viewModel)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
