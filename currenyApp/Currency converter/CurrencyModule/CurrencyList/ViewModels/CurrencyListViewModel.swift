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
    
    //MARK: properties
    @Published var errorExist = false
    @Published var errorMessage = ""
    @Published var isApiLoading = false
    @Published var currency : CurrencyModel?
    var subscriptions = Set<AnyCancellable>()
    private let currencyRepo : CurrencyRepositoryProtocol
    
    //MARK: init
    init(currencyRepo : CurrencyRepositoryProtocol = CurrencyRepository()) {
        self.currencyRepo = currencyRepo
    }
    
    //MARK: methods
    func fetchCurrencyRates() {
        if !isApiCalledBefore() {
            isApiLoading = true
            currencyRepo.fetchCurrencyRates()
                .sink { _ in
                } receiveValue: { [weak self] (response)  in
                    switch response.result {
                    case .success(let model):
                        if let self = self {
                            self.onSuccess(model: model)
                        }
                    case .failure(let error):
                        if let self = self {
                            self.onFailure(error: error)
                        }
                    }
                }.store(in: &subscriptions)
        }
    }
    
    private func isApiCalledBefore() -> Bool {
        if currency != nil {
            return true
        }
        return false
    }
    
    private func onSuccess(model: CurrencyModel) {
        self.isApiLoading = false
        self.currency = model
    }
    
    private func onFailure(error: Error) {
        self.isApiLoading = false
        self.errorExist = true
        self.errorMessage = error.localizedDescription
    }
 
    func calculateRate(value : Double , rate : Double) -> Double {
        return value * rate
    }
}
