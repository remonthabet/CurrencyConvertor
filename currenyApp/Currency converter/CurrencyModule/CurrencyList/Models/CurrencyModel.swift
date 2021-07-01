//
//  CurrencyRates.swift
//  Currency converter
//
//  Created by Remon on 30/06/2021.
//

import Foundation

struct CurrencyModel: Codable {
    let success: Bool
    let timestamp: Int
    let base, date: String
    let rates: [String: Double]
}


