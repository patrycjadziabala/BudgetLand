//
//  AllExpenses.swift
//  BudgetLand
//
//  Created by Patka on 18/07/2023.
//

import SwiftUI

struct AllExpenses: View {
    @State private var timePeriodFilter: Recurrence = .monthly
    
    var body: some View {
        
        NavigationView(content: {
            VStack (spacing: 10){
                HStack {
                    Text(Constants.totalFor)
                        .font(.custom(Constants.fontBold, size: 20))
                    Picker("", selection: $timePeriodFilter, content: {
                        Text(Constants.today)
                        Text(Constants.thisWeek)
                        Text(Constants.thisMonth)
                        Text(Constants.thisYear)
                    })
                    .pickerStyle(.menu)
                        .navigationTitle(Constants.allExpenses)
                } //hstack
              
            }
        })
      
        .foregroundColor(Color(Constants.customDarkBlue))
//        .background(ignoresSafeAreaEdges: .all)
       
    }
   
}
   
struct AllExpenses_Previews: PreviewProvider {
    static var previews: some View {
        AllExpenses()
    }
}
