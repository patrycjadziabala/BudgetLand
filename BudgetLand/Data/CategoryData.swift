//
//  CategoryData.swift
//  BudgetLand
//
//  Created by Patka on 28/06/2023.
//

import Foundation

var customCategories = [
    Category(name: "Food", color: .blue, icon: "cart", amount: 100),
    Category(name: "Bills", color: .red, icon: "dollarsign.circle", amount: 100),
    Category(name: "Transport", color: .accentColor, icon: "car", amount: 100),
    Category(name: "Holiday", color: .cyan, icon: "suitcase.rolling", amount: 100),
    Category(name: "Health", color: .gray, icon: "bandage", amount: 100),
    Category(name: "Subscriptions", color: .green, icon: "clock.arrow.2.circlepath", amount: 100),
    Category(name: "Loans", color: .orange, icon: "creditcard", amount: 100),
    Category(name: "Shopping", color: .pink, icon: "bag", amount: 100)
]

let icons = [Constants.animalIcon,
             Constants.flowerIcon,
             Constants.scienceIcon,
             Constants.mountain,
             Constants.water,
             Constants.snow,
             Constants.night,
             Constants.sun,
             Constants.globe,
             Constants.people,
             Constants.gift
]

let colors = [
    Constants.customBlue,
    Constants.customPink,
    Constants.customGreen,
    Constants.customPurple,
    Constants.customYellow,
    Constants.customDarkBlue,
    Constants.customDarkPink,
    Constants.customDarkPurple
]
