//
//  CurrencyRepository.swift
//  Skeltone
//
//  Created by Remon on 30/06/2021.
//

import Foundation
import Combine
import Alamofire
struct CurrencyRepository : CurrencyRepositoryProtocol {
    
    //MARK: properties
    fileprivate let provider: NetworkProviderProtocol
    
    //MARK: init
    init(provider: NetworkProviderProtocol = DefaultNetworkProvider()) {
        self.provider = provider
    }
    
    //MARK: methods
    func fetchCurrencyRates() -> DataResponsePublisher<CurrencyModel> {
        let endpoint = CurrencyEndPoint.fetchCurrencyRates
        return provider.get(type: CurrencyModel.self, endpoint: endpoint)
    }
}
