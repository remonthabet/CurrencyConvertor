//
//  AuthRepository.swift
//  Skeltone
//
//  Created by Saleh AlDhobaie on 06/03/2020.
//  Copyright © 2020 Saleh AlDhobaie. All rights reserved.
//

import Foundation
import Combine
import Alamofire
protocol CurrencyRepositoryProtocol {    
    func fetchCurrencyRates() -> DataResponsePublisher<CurrencyModel>
}


