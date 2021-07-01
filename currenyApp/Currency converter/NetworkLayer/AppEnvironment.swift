//
//  AppEnvironment.swift
//  Skeltone
//
//  Created by Saleh AlDhobaie on 03/03/2020.
//  Copyright © 2020 Saleh AlDhobaie. All rights reserved.
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
