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
                    Label("Home", systemImage: Constants.homeIcon)
                }
            ReportsMainView()
                .tabItem {
                    Label("Reports", systemImage: Constants.chartIcon)
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: Constants.settingsIcon)
                }
        } //tabView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
