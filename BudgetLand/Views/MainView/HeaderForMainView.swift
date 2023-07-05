//
//  HeaderForMainView.swift
//  BudgetLand
//
//  Created by Patka on 28/06/2023.
//

import SwiftUI

struct HeaderForMainView: View {
    @State private var addMoney: Bool = false
    
    var body: some View {
        ZStack {
            Image(Constants.mainHeaderBackground)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack (spacing: 45) {
                Text(Constants.dashboard)
                    .font(.custom(Constants.fontExtraBold, size: 40))
                    .frame(alignment: .center)
                    .offset(y: 90)
                Text("1,500.00")
                    .font(.custom(Constants.fontMedium, size: 30))
                    .foregroundColor(.white)
                    .shadow(radius: 4)
                    .offset(y: 70)
                Text("Money left this month")
                    .offset(y: 30)
                HStack {
                    Text("Out of")
                        .font(.custom(Constants.fontMedium, size: 10))
                    Text("6000")
                        .font(.custom(Constants.fontBold, size: 12))
                    Text("budget")
                        .font(.custom(Constants.fontMedium, size: 10))
                } // hstack
                .offset(y: -12)
                Spacer()
                Button {
                    addMoney.toggle()
                } label: {
                    Text("Add Money")
                        .font(.custom(Constants.fontExtraBold, size: 20))
                        .background(
                        Capsule()
                            .strokeBorder(lineWidth: 3)
                            .shadow(radius: 6)
                            .padding([.top, .bottom, .leading, .trailing], -7)
                        )
                } //button
                .offset(x: 130, y: -20)
            } // vstack
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
