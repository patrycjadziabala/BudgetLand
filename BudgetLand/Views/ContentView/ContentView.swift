//
//  ContentView.swift
//  BudgetLand
//
//  Created by Patka on 12/07/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Label(Constants.home, systemImage: Constants.homeIcon)
                }
            ReportsMainView()
                .tabItem {
                    Label(Constants.reports, systemImage: Constants.chartIcon)
                }
            SettingsView()
                .tabItem {
                    Label(Constants.settings, systemImage: Constants.settingsIcon)
                }
        } //tabView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
