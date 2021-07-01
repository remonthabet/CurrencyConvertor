//
//  AuthTargets.swift
//  Skeltone
//
//  Created by Saleh AlDhobaie on 03/03/2020.
//  Copyright © 2020 Saleh AlDhobaie. All rights reserved.
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
