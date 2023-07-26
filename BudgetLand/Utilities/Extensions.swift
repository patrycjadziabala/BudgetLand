//
//  Extensions.swift
//  BudgetLand
//
//  Created by Patka on 05/07/2023.
//

import Foundation

extension String {
    var isNumeric: Bool {
        Double(self) != nil
    }
    
    func isGreaterThan(_ value: Double) -> Bool {
        guard self.isNumeric else {
            return false
        }
        return Double(self)! > value
    }
}
// MARK: - Number formatter
extension NumberFormatter {
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
}


// MARK: - Date formatter
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


