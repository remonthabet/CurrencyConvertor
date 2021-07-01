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
struct CurrencyRepositoryImp : CurrencyRepository {

    fileprivate let provider: NetworkProviderProtocol
    init(provider: NetworkProviderProtocol = DefaultNetworkProvider()) {
        self.provider = provider
    }
    
    
    func fetchCurrencyRates() -> DataResponsePublisher<CurrencyModel> {
        let endpoint = CurrencyEndPoint.fetchCurrencyRates

        return provider.get(type: CurrencyModel.self, endpoint: endpoint)

    }
    

}
