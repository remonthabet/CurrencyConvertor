//
//  CurrencyEndPoint.swift
//  Skeltone
//
//  Created by Remon on 30/06/2021.
//

import Foundation
import Alamofire
enum CurrencyEndPoint {
    case fetchCurrencyRates
}

extension CurrencyEndPoint: EndPointProtcol {
    

    var body: [String:String]? {
        return nil
    }
    

    var path: URL {
        switch self {
        case .fetchCurrencyRates:
            return URL(string: baseURL + "/api/latest?access_key=\(AppEnvironment.accessKey)")!
        }
    }

    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }

    }
    
    var headers: HTTPHeaders? {
       return nil
    }
}
