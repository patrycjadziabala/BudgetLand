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
        formatter.dateFormat = "dd/mm/yyyy"
        
        return formatter
    }()
}

extension String {
    func dateParsed() -> Date {
        guard let parsedDate = DateFormatter.allNumeric.date(from: self) else {
            return Date()
        }
        return parsedDate
    }
}
