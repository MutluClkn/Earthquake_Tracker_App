//
//  TabBarController.swift
//  Earthquake Tracker App
//
//  Created by Mutlu Çalkan on 22.06.2022.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let mapVC = UINavigationController(rootViewController: MapViewController())
        
        homeVC.tabBarItem.image = UIImage(systemName: "waveform.path.ecg")
        mapVC.tabBarItem.image = UIImage(systemName: "mappin.and.ellipse")
        
        homeVC.title = "Home"
        mapVC.title = "Map"
        
        tabBar.tintColor = .label
        
        setViewControllers([homeVC, mapVC], animated: true)
    }

}
