//
//  LatestRates.swift
//  CurrencyTracker
//
//  Created by Lakith Jayalath on 2021-11-19.
//

import Foundation

// MARK: - LatestRates
struct LatestRates: Codable {
    let motd: MOTD
    let success: Bool
    let base, date: String
    let rates: [String: Double]
}

// MARK: - MOTD
struct MOTD: Codable {
    let msg: String
    let url: String
}
