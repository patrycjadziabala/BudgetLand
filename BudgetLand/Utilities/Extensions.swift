//
//  Extensions.swift
//  BudgetLand
//
//  Created by Patka on 05/07/2023.
//

import Foundation

extension DateFormatter {
    static let allNumeric: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/YYYY"
        
        return formatter
    }()
}

extension Date {
    func toString() -> String {
        DateFormatter.allNumeric.string(from: self)
    }
}

extension Optional where Wrapped == String {
    var _bound: String? {
        get {
            return self
        }
        set {
            self = newValue
        }
    }
    public var bound: String {
        get {
            return _bound ?? ""
        }
        set {
            _bound = newValue.isEmpty ? nil : newValue
        }
    }
}


