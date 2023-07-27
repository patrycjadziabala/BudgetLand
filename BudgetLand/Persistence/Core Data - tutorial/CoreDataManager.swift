//
//  CoreDataManager.swift
//  BudgetLand
//
//  Created by Patka on 20/07/2023.
//

import Foundation
import CoreData

// Tutorial

class CoreDataManager {
    
    static let shared = CoreDataManager()
    let persistentContainer: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "BudgetLand")
        persistentContainer.loadPersistentStores { description, error in
            if let error {
                print(error.localizedDescription)
                fatalError("Unable to load Core Data Model \(error)")
              
            }
        }
    }
    func save() {
        do {
            try viewContext.save()
        } catch let error {
            print("Error saving to database \(error.localizedDescription)")
        }
    }
}
