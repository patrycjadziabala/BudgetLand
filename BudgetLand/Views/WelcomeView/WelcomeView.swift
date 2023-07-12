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
            .opacity(0.65)
            .cornerRadius(180)
    }
    func iconModifier(width: CGFloat) -> some View {
        self.imageModifier()
            .frame(maxWidth: width)
            .foregroundColor(.green)
            .opacity(0.5)
    }
}

struct WelcomeView: View {
    @AppStorage("welcomeViewShown")
    var welcomeViewShown: Bool = false
    
    @State private var showEntry: Bool = true
    @State private var name: String = ""
    @StateObject var viewModel = WelcomeViewModel()
    
    private let imageURL: String = Constants.welcomeScreenImage
    
    var body: some View {
        if showEntry {
            ZStack {
                Color(Constants.customGreen)
                VStack {
                    Text(Constants.budgetLand)
                        .font(.system(size: 50))
                        .fontWeight(.black)
                        .foregroundStyle(
                            LinearGradient(colors: [.blue, .green, .cyan], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .shadow(radius: 1)
                    
                    AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .easeIn(duration: 0.7))) { phase in
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
                    .padding(90)
                    //                    TextField("Enter your name", text: $name)
                    //                        .padding()
                    //                .background(Color(Constants.customGreen).opacity(0.9)
                    //                        )
                    HStack {
                        Text(Constants.trackYourExpenses)
                            .font(.system(size: 25))
                            .shadow(radius: 2)
                        Image(systemName: Constants.coinImage)
                            .shadow(radius: 5)
                    } // hstack
                    EnterButton(showEntry: $showEntry)
                } // vstack
            } // zstack
            .ignoresSafeArea()
            .onAppear(perform: {
                UserDefaults.standard.welcomeViewShown = true
            })
        } else {
            MainView()
        }
        
    }
    
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
