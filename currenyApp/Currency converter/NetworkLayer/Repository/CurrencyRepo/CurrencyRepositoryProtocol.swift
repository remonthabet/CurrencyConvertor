//
//  CurrencyRepositoryProtocol.swift
//  Skeltone
//
//  Created by Remon on 30/06/2021.
//

import Foundation
import Combine
import Alamofire
protocol CurrencyRepositoryProtocol {    
    func fetchCurrencyRates() -> DataResponsePublisher<CurrencyModel>
}


