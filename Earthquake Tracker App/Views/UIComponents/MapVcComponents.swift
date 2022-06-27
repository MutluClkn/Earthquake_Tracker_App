//
//  MapVcComponents.swift
//  Earthquake Tracker App
//
//  Created by Mutlu Çalkan on 22.06.2022.
//
import Foundation
import MapKit

struct MapVcComponents {
    
    //MARK: - Map View Controller UI Components
    
    public let mapView : MKMapView = {
        let map = MKMapView()
        map.overrideUserInterfaceStyle = .dark
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
}

