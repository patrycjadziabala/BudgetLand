//
//  BudgetLandApp.swift
//  BudgetLand
//
//  Created by Patka on 27/06/2023.
//

import SwiftUI

@main
struct BudgetLandApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
