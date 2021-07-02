//
//  AppEnvironment.swift
//  Skeltone
//
//  Created by Remon on 30/06/2021.
//

import Foundation
struct AppEnvironment {

    static var accessKey : String = "dfc7a6c35b3bc4b1337e0fb0f277ccfd"
    
    static var apiURL : String {
        #if DEVELOPMENT
        return "http://data.fixer.io/"
        #elseif QA
        return ""
        #elseif Stage
        return ""
        #elseif PRODUCTION
        return ""
        #else
        fatalError("issue !")
        #endif
    }
    
 

}
