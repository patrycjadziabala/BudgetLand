//
//  EnterButton.swift
//  BudgetLand
//
//  Created by Patka on 27/06/2023.
//

import SwiftUI

struct EnterButton: View {
    @Binding var showEntry: Bool
    var body: some View {
        Button {
            showEntry.toggle()
        } label: {
            Text(Constants.enter)
                .font(.system(size: 35))
                .foregroundColor(.white)
                .shadow(radius: 9)
                .padding([.top, .bottom, .leading, .trailing], 8)
                .padding([.leading, .trailing])
                .background(
                    Capsule()
                        .strokeBorder(lineWidth: 1)
                        .foregroundColor(.white)
                        .shadow(radius: 2)
                )
        }
    }
}

struct EnterButton_Previews: PreviewProvider {
    static var previews: some View {
        EnterButton(showEntry: .constant(true))
            .previewLayout(.sizeThatFits)
    }
}
