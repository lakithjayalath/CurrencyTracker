//
//  CTExchangeRateService.swift
//  CurrencyTracker
//
//  Created by Lakith Jayalath on 2021-11-19.
//

import Foundation
import Alamofire

enum CurrencyTrackerExchangeRateService {
    
    case getLatestRates
    
    var url: URL {
        switch self {
        case .getLatestRates: return URL(string: CurrencyTrackerExchangeRateServicePath.getLatestRates)!
        }
    }
    
    var method: HTTPMethod {
        return HTTPMethod.get
    }
    
}

struct CurrencyTrackerExchangeRateServicePath {
    
    static var getLatestRates: String {
        return NetworkManager.BASE_URL.EXCHANGE_RATE_BASE_URL + "latest"
    }
    
}
