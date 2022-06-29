//
//  EarthquakeTracker.swift
//  Earthquake Tracker App
//
//  Created by Mutlu Çalkan on 25.06.2022.
//

import Foundation

struct EarthquakeTracker : Codable {
    let data: [Datum]
}

struct Datum : Codable {
    let m, lon, lat: String
    let city: String
    let district: String
    let depth: String
    let time: String
}


