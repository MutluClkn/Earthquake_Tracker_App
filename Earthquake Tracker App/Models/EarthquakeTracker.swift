//
//  EarthquakeTracker.swift
//  Earthquake Tracker App
//
//  Created by Mutlu Çalkan on 25.06.2022.
//

import Foundation

// MARK: - EarthquakeTracker
struct EarthquakeTracker {
    let status: Bool
    let desc: String
    let result: [Result]
}

// MARK: - Result
struct Result {
    let id: ID
    let mag, lng, lat: Double
    let lokasyon: String
    let depth: Double
    let coordinates: [Double]
    let title: String
    let rev: NSNull
    let timestamp: Int
    let dateStamp, date, hash, hash2: String
}

// MARK: - ID
struct ID {
    let oid: String
}

