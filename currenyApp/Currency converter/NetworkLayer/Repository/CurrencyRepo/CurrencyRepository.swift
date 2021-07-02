//
//  AuthRepositoryImp.swift
//  Skeltone
//
//  Created by Saleh AlDhobaie on 06/03/2020.
//  Copyright © 2020 Saleh AlDhobaie. All rights reserved.
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
