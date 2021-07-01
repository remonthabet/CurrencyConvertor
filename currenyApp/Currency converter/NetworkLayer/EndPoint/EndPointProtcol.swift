//
//  EndPointProtcol.swift
//  Bus Management
//
//  Created by Remon on 09/06/2021.
//

import Foundation
import Alamofire
protocol EndPointProtcol {
    
    var baseURL: String { get }

    var path: URL { get }
    
    var method: HTTPMethod { get }

    var body: [String: String]? { get }

    var headers: HTTPHeaders? { get }
}

extension EndPointProtcol {
    
    var baseURL: String {
        return AppEnvironment.apiURL
    }
}
