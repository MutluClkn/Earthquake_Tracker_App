//
//  HomeViewController.swift
//  Earthquake Tracker App
//
//  Created by Mutlu Çalkan on 22.06.2022.
//

import UIKit
import SnapKit
import Lottie
import MapKit

class HomeViewController: UIViewController, MKMapViewDelegate, EarthquakeTrackerDelegate {

    // MARK: - Fetching datas from HomeProperties.swift
    let properties = HomeVcComponents()
    
    // MARK: - Fetching datas from MapProperties.swift
    let mapProperties = MapVcComponents()
    
    // API Caller
    private var api = APICaller()
    
    
    // AnimationView
    let animationView = AnimationView()
    let magnitudeAnimationView = AnimationView()
    let depthAnimationView = AnimationView()
    let cityAnimationView = AnimationView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    
        view.addSubview(properties.magnitudeLabel)
        view.addSubview(properties.depthLabel)
        view.addSubview(properties.magnitudeLevel)
        view.addSubview(properties.depthLevel)
        view.addSubview(properties.citySubtitle)
        view.addSubview(properties.cityLabel)
        view.addSubview(properties.latestEarthquakeLabel)
        view.addSubview(properties.dateAndTimeLabel)

        // Map
        view.addSubview(mapProperties.mapView)
        mapProperties.mapView.delegate = self
        
        // Animation funcs
        magnitudeAnimation("magnitude")
        depthAnimation("depth")
        pinAnimation("location")
        
        constraints()
        
        // EarthquakeTrackerModel & APICaller
        api.delegate = self
        
        api.performRequest(urlString: api.earthquakeURL)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // To keep animate after changing views.
        magnitudeAnimation("magnitude")
        depthAnimation("depth")
        pinAnimation("location")
    }
    
    // MARK: - Updating UI by services
    func didUpdateView (_ apiCaller : APICaller, tracker : EarthquakeTrackerModel){
        DispatchQueue.main.async {
            self.properties.magnitudeLevel.text = tracker.magnitude
            self.properties.citySubtitle.text = tracker.city
            self.properties.depthLevel.text = tracker.depth
            self.properties.dateAndTimeLabel.text = tracker.date
            let annotation = MKPointAnnotation()
            annotation.title = tracker.city
            annotation.subtitle = tracker.district
            if let latitude = Double(tracker.latitude){
                if let longtitude = Double(tracker.longitude){
                    let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)
                    annotation.coordinate = coordinate
                    self.mapProperties.mapView.addAnnotation(annotation)
                    
                    let center = CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)//38 35
                    let span = MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5)
                    let region = MKCoordinateRegion(center: center, span: span)
                    self.mapProperties.mapView.setRegion(region, animated: true)
                }
            }
        }
    }
    func didFailWithError(error: Error) {
        print(error)
    }
    
    // MARK: - Animation Settings
    private func magnitudeAnimation(_ name: String){
        magnitudeAnimationView.animation = Animation.named(name)
        magnitudeAnimationView.backgroundColor = .systemBackground
        magnitudeAnimationView.contentMode = .scaleAspectFit
        magnitudeAnimationView.loopMode = .loop
        magnitudeAnimationView.play()
        view.addSubview(magnitudeAnimationView)
    }
    private func depthAnimation(_ name: String){
        depthAnimationView.animation = Animation.named(name)
        depthAnimationView.backgroundColor = .systemBackground
        depthAnimationView.contentMode = .scaleAspectFit
        depthAnimationView.loopMode = .loop
        depthAnimationView.play()
        view.addSubview(depthAnimationView)
    }
    private func pinAnimation(_ name: String){
        cityAnimationView.animation = Animation.named(name)
        cityAnimationView.backgroundColor = .systemBackground
        cityAnimationView.contentMode = .scaleAspectFit
        cityAnimationView.loopMode = .loop
        cityAnimationView.play()
        view.addSubview(cityAnimationView)
    }
    
    // MARK: - HomeVC Constraints
    private func constraints(){
        
        mapProperties.mapView.snp.makeConstraints { make in
            make.top.equalTo(view)
            make.right.equalTo(view)
            make.left.equalTo(view)
            make.height.equalTo(view.frame.height * 0.45)
        }
        
        properties.latestEarthquakeLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(mapProperties.mapView.snp_bottomMargin).offset(25)
        }
        
        properties.dateAndTimeLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(properties.latestEarthquakeLabel.snp_bottomMargin).offset(15)
        }
        
        magnitudeAnimationView.snp.makeConstraints { make in
            make.top.equalTo(properties.dateAndTimeLabel.snp_bottomMargin).offset(30)
            make.width.equalTo(50)
            make.height.equalTo(50)
            make.centerX.equalTo(properties.magnitudeLabel)
        }
        
        properties.magnitudeLabel.snp.makeConstraints { make in
            make.top.equalTo(magnitudeAnimationView.snp_bottomMargin).offset(10)
            make.left.equalTo(view)
            make.right.equalTo(properties.depthLabel.snp_leftMargin)
            make.width.equalTo(view.frame.width / 2)
        }
        
        properties.magnitudeLevel.snp.makeConstraints { make in
            make.top.equalTo(properties.magnitudeLabel.snp_bottomMargin).offset(10)
            make.centerX.equalTo(properties.magnitudeLabel)
        }
        
        depthAnimationView.snp.makeConstraints { make in
            make.centerY.equalTo(magnitudeAnimationView)
            make.width.equalTo(50)
            make.height.equalTo(50)
            make.centerX.equalTo(properties.depthLabel)
        }
        
        properties.depthLabel.snp.makeConstraints { make in
            make.centerY.equalTo(properties.magnitudeLabel)
            make.right.equalTo(view)
        }
        
        properties.depthLevel.snp.makeConstraints { make in
            make.top.equalTo(properties.depthLabel.snp_bottomMargin).offset(10)
            make.centerX.equalTo(properties.depthLabel)
        }
        
        cityAnimationView.snp.makeConstraints { make in
            make.top.equalTo(properties.depthLevel.snp_bottomMargin).offset(10)
            make.width.equalTo(50)
            make.height.equalTo(50)
            make.centerX.equalTo(properties.cityLabel)
        }
        
        properties.cityLabel.snp.makeConstraints { make in
            
            make.top.equalTo(cityAnimationView.snp_bottomMargin).offset(10)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        properties.citySubtitle.snp.makeConstraints { make in
            make.top.equalTo(properties.cityLabel.snp_bottomMargin).offset(10)
            make.centerX.equalTo(properties.cityLabel)
        }
    }
}

