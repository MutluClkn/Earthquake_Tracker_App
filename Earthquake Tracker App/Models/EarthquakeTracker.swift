//
//  EarthquakeTracker.swift
//  Earthquake Tracker App
//
//  Created by Mutlu Çalkan on 25.06.2022.
//

import Foundation

// MARK: - EarthquakeTracker
struct EarthquakeTracker : Decodable {
    let result: [Result]
}

// MARK: - Result
struct Result : Decodable {
    let mag, lng, lat: Double
    let lokasyon: String
    let depth: Double
    let coordinates: [Double]
    let title: String
    let date: String
}

