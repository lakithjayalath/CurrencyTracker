//
//  NetworkManager.swift
//  CurrencyTracker
//
//  Created by Lakith Jayalath on 2021-11-19.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    struct BASE_URL {
        
//        static let EXCHANGE_RATE_BASE_URL = "https://api.exchangerate.host/"
        
    }
    
    func performRequest(url: URL, method: HTTPMethod) {
        AF.request(url, method: method).response { response in
            debugPrint(response)
        }
    }
    
}
