////
////  Overview.swift
////  BudgetLand
////
////  Created by Patka on 05/07/2023.
////
//
//import SwiftUI
//
//struct Overview: View {
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                VStack(alignment: .leading, spacing: 20) {
//                    Text(Constants.overview)
//                        .font(.custom(Constants.fontExtraBold, size: 35))
//                        .foregroundColor(Color(Constants.fontColorOverview))
//                        .shadow(radius: 8)
//                } //vstack
//                .padding()
//                .frame(maxWidth: .infinity)
//            } // scrollView
//            .background(Color(Constants.customBlue))
//            .navigationBarTitleDisplayMode(.inline)
//            .toolbar {
//                ToolbarItem {
//                    Image(systemName: Constants.bellBadge)
//                        .symbolRenderingMode(.palette)
//                        .foregroundStyle(Color(Constants.fontColorOverview), .primary)
//                }
//            }
//        } //navigationView
//        .navigationViewStyle(.stack)
//    }
//}
//
//struct Overview_Previews: PreviewProvider {
//    static var previews: some View {
//        Overview()
//    }
//}
