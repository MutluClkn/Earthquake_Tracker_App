//
//  MapViewController.swift
//  Earthquake Tracker App
//
//  Created by Mutlu Çalkan on 22.06.2022.
//

import UIKit
import MapKit
import SnapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    let mapProperties = MapProperties()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        view.addSubview(mapProperties.mapView)
        mapProperties.mapView.delegate = self
        
        mapConstraints()
    }

    func mapConstraints(){
        mapProperties.mapView.snp.makeConstraints { make in
            make.top.equalTo(view)
            make.left.equalTo(view)
            make.right.equalTo(view)
            make.height.equalTo(view.frame.height / 2)
        }
    }
}

