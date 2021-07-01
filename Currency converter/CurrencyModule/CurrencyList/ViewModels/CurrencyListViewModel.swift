//
//  LoginViewModel.swift
//  Bus Management
//
//  Created by Remon on 19/05/2021.
//

import Foundation
import Combine
import Alamofire

class CurrencyListViewModel: ObservableObject {
    

    @Published var showAlert = false
    @Published var alertMessage = ""
    @Published var isloading = false
    @Published var currency : CurrencyModel?


    
    var subscriptions = Set<AnyCancellable>()

    private let currencyRepo : CurrencyRepository
    
    // use dependency injection with protcols
    init(currencyRepo : CurrencyRepository = CurrencyRepositoryImp()) {
        self.currencyRepo = currencyRepo
    }
    
    
    func fetchCurrencyRates() {
        if currency != nil {
            return
        }
        isloading = true
        currencyRepo.fetchCurrencyRates()
            .sink { _ in
            } receiveValue: { [weak self] (response)  in
                switch response.result {
                case .success(let model):
                    if let self = self {
                        self.isloading = false
                        self.currency = model

                    }
                case .failure(let error):
                    if let self = self {
                        self.isloading = false
                        self.showAlert = true
                        self.alertMessage = error.localizedDescription
                    }
                    
                }
            }.store(in: &subscriptions)
    }
    
}
