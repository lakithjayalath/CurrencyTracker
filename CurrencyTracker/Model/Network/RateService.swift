//
//  RatesService.swift
//  CurrencyTracker
//
//  Created by Lakith Jayalath on 2021-11-26.
//

import Foundation
import Alamofire

class RateService {
    
    // get latest rates
    func getLatestRates() {
        NetworkManager.shared.performRequest(url: CurrencyTrackerExchangeRateService.getLatestRates.url, method: CurrencyTrackerExchangeRateService.getLatestRates.method)
    }
    
}
