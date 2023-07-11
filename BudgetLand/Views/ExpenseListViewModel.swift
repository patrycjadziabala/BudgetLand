////
////  ExpenseListViewModel.swift
////  BudgetLand
////
////  Created by Patka on 06/07/2023.
////
//
//import Foundation
//import Combine
//
//final class ExpenseListViewModel: ObservableObject {
//    @Published var expenses: [ExpenseModel] = []
//    
//    private var cancellables = Set<AnyCancellable>()
//    
//    init() {
//        getExpenses()
//    }
//    
//    func getExpenses() {
//        guard let url = URL(string: "https://designcode.io/data/transactions.json") else {
//            print("Invalid url")
//            return
//        }
//        URLSession.shared.dataTaskPublisher(for: url)
//            .tryMap { (data, response) -> Data in
//                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
//                    dump(response)
//                    throw URLError(.badServerResponse)
//                }
//                return data
//            }
//            .decode(type: [ExpenseModel].self, decoder: JSONDecoder())
//            .receive(on: DispatchQueue.main)
//            .sink { completion in
//                switch completion {
//                case .failure(let error):
//                    print("Error fetching expenses", error.localizedDescription)
//                case .finished:
//                    print("Finished fetching transactions")
//                }
//            } receiveValue: { [weak self] result in
//                self?.expenses = result
//                dump(self?.expenses)
//            }
//            .store(in: &cancellables)
//    }
//}
