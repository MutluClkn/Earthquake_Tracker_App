//
//  EarthquakeTracker.swift
//  Earthquake Tracker App
//
//  Created by Mutlu Çalkan on 25.06.2022.
//

import Foundation

struct EarthquakeTracker : Codable {
    let result: [Result]
}

struct Result : Codable {
    let mag, lng, lat: Double
    let lokasyon: String
    let depth: Double
    let title: String
    let date: String
}


