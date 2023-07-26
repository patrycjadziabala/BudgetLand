//
//  BudgetLandApp.swift
//  BudgetLand
//
//  Created by Patka on 27/06/2023.
//

import SwiftUI

extension UserDefaults {

    var welcomeViewShown: Bool {
        get {
            return (UserDefaults.standard.value(forKey: "welcomeViewShown") as? Bool) ?? false
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "welcomeViewShown")
        }
    }
}

@main
struct BudgetLandApp: App {
    
    var body: some Scene {
        WindowGroup {
//            SettingsView().environment(\.managedObjectContext, CoreDataManager.shared.persistentContainer.viewContext)
            ContentView().environment(\.managedObjectContext, CoreDataManager.shared.persistentContainer.viewContext)
//            if UserDefaults.standard.welcomeViewShown {
//                ContentView().environment(\.managedObjectContext, CoreDataManager.shared.persistentContainer.viewContext)
//                 ".environment(\.managedObjectContext, CoreDataManager.shared.persistentContainer.viewContext)" from tutorial
//            } else {
//                WelcomeView()
//            }
        }
    }
}
