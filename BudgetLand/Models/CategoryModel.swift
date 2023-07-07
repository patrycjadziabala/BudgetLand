//
//  CategoryModel.swift
//  BudgetLand
//
//  Created by Patka on 28/06/2023.
//

import Foundation
import SwiftUI

struct Category: Identifiable {
    var id = UUID()
    var title: String
    var icon: String
}
