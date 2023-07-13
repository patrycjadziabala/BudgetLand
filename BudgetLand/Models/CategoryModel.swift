//
//  CategoryModel.swift
//  BudgetLand
//
//  Created by Patka on 28/06/2023.
//

import SwiftUI

struct Category: Identifiable {
    var id = UUID()
    var title: String
    var color: Color
    var icon: String
}

