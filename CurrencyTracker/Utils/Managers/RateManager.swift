//
//  RateManager.swift
//  CurrencyTracker
//
//  Created by Lakith Jayalath on 2021-11-26.
//

import Foundation

class RateManager {
    
    private let service: RateService
    
    init(rateService: RateService) {
        self.service = rateService
    }
    
}
