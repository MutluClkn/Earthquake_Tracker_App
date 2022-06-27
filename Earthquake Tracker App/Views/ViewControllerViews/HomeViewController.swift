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

class HomeViewController: UIViewController, MKMapViewDelegate {

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

        //Map
        view.addSubview(mapProperties.mapView)
        mapProperties.mapView.delegate = self
        
        // Animation funcs
        magnitudeAnimation()
        depthAnimation()
        pinAnimation()
        
        constraints()
        
        properties.dateAndTimeLabel.text = ""
        
        api.performRequest(urlString: api.earthquakeURL)
        
    }
    
    // MARK: - Animation Settings
    private func magnitudeAnimation(){
        magnitudeAnimationView.animation = Animation.named("magnitude")
        magnitudeAnimationView.backgroundColor = .systemBackground
        magnitudeAnimationView.contentMode = .scaleAspectFit
        magnitudeAnimationView.loopMode = .loop
        magnitudeAnimationView.play()
        view.addSubview(magnitudeAnimationView)
    }
    private func depthAnimation(){
        depthAnimationView.animation = Animation.named("depth")
        depthAnimationView.backgroundColor = .systemBackground
        depthAnimationView.contentMode = .scaleAspectFit
        depthAnimationView.loopMode = .loop
        depthAnimationView.play()
        view.addSubview(depthAnimationView)
    }
    private func pinAnimation(){
        cityAnimationView.animation = Animation.named("location")
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
            make.height.equalTo(view.frame.height * 0.6)
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
            make.left.equalTo(view).offset(15)
            make.right.equalTo(properties.cityLabel.snp_leftMargin).offset(-15)
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
            make.right.equalTo(view).offset(-15)
            make.left.equalTo(properties.cityLabel.snp_rightMargin).offset(15)
        }
        
        properties.depthLevel.snp.makeConstraints { make in
            make.top.equalTo(properties.depthLabel.snp_bottomMargin).offset(10)
            make.centerX.equalTo(properties.depthLabel)
        }
        
        cityAnimationView.snp.makeConstraints { make in
            make.centerY.equalTo(depthAnimationView)
            make.width.equalTo(50)
            make.height.equalTo(50)
            make.centerX.equalTo(properties.cityLabel)
        }
        
        properties.cityLabel.snp.makeConstraints { make in
            make.centerY.equalTo(properties.depthLabel)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        properties.citySubtitle.snp.makeConstraints { make in
            make.top.equalTo(properties.cityLabel.snp_bottomMargin).offset(10)
            make.centerX.equalTo(properties.cityLabel)
        }
    }
}

