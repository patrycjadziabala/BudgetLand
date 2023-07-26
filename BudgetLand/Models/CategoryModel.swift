//
//  CategoryModel.swift
//  BudgetLand
//
//  Created by Patka on 28/06/2023.
//

import SwiftUI

struct Category: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var color: Color
    var icon: String
    var amount: Double
}

