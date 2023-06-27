//
//  WelcomeView.swift
//  BudgetLand
//
//  Created by Patka on 27/06/2023.
//

import SwiftUI

extension Image {
    func imageModifier() -> some View {
        self.resizable()
            .scaledToFit()
            .opacity(0.7)
    }
    func iconModifier(width: CGFloat) -> some View {
        self
            .imageModifier()
            .frame(maxWidth: width)
            .foregroundColor(.green)
            .opacity(0.5)
    }
}

struct WelcomeView: View {
    
    private let imageURL: String = Constants.welcomeScreenImage
    
    var body: some View {
        
        VStack {
            Text(Constants.budgetLand)
                .font(.system(size: 50))
                .fontWeight(.black)
                .foregroundStyle(
                    LinearGradient(colors: [.blue, .green, .cyan], startPoint: .topLeading, endPoint: .bottomTrailing))
                .shadow(radius: 1)
            
            AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .easeIn(duration: 1))) { phase in
                switch phase {
                case .success(let image):
                    image.imageModifier()
                case .failure(_):
                    Image(systemName: Constants.antFill).iconModifier(width: 300)
                case .empty:
                    Image(systemName: Constants.photoCircleFill).iconModifier(width: 300)
                @unknown default:
                    ProgressView()
                }
            }
            .padding(80)
            
            HStack {
                Text(Constants.trackYourExpenses)
                    .font(.system(size: 25))
                    .shadow(radius: 2)
                Image(systemName: Constants.coinImage)
                    .shadow(radius: 5)
               
            }
            
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
