//
//  HeaderForMainView.swift
//  BudgetLand
//
//  Created by Patka on 28/06/2023.
//

import SwiftUI

struct HeaderForMainView: View {
    var body: some View {
        ZStack {
            Image(Constants.mainHeaderBackground)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack (spacing: 45) {
                Text("Dashboard")
                    .font(.custom(Constants.fontExtraBold, size: 40))
                    .frame(alignment: .center)
                    .offset(y: 90)
                Text("1,500.00")
                    .font(.custom(Constants.fontMedium, size: 30))
                    .foregroundColor(.white)
                    .shadow(radius: 4)
                    .offset(y: 70)
                Text("Total spent this month so far")
                    .offset(y: 30)
                Spacer()
            }
        } //zstack
        .frame(height: 350)
        .edgesIgnoringSafeArea(.top)
    }
}

struct HeaderForMainView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderForMainView()
    }
}
