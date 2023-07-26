//
//  Expenses+CoreDataProperties.swift
//  BudgetLand
//
//  Created by Patka on 10/07/2023.
//
//

import Foundation
import CoreData


extension Expenses {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Expenses> {
        return NSFetchRequest<Expenses>(entityName: "Expenses")
    }
 
    @NSManaged public var expenseDate: Date?
    @NSManaged public var expenseAmount: Double
    @NSManaged public var expenseTitle: String?
    @NSManaged public var expenseType: ExpenseType
    @NSManaged public var id: UUID?

    var type: ExpenseType {
        get {
            return ExpenseType(rawValue: expenseType.rawValue) ?? .bills
        }
        set {
            self.expenseType = newValue
        }
    }

}

extension Expenses : Identifiable {

}
