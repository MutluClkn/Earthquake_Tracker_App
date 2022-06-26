//
//  TabBarController.swift
//  Earthquake Tracker App
//
//  Created by Mutlu Çalkan on 22.06.2022.
//

import UIKit

class TabBarController: UITabBarController {

    // MARK: - Tab Bar Settings
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let tableViewVC = UINavigationController(rootViewController: TableViewViewController())
        
        homeVC.tabBarItem.image = UIImage(systemName: "waveform.path.ecg")
        tableViewVC.tabBarItem.image = UIImage(systemName: "list.bullet.indent")
        
        homeVC.title = "Home"
        tableViewVC.title = "List"
        
        tabBar.tintColor = .label
        
        setViewControllers([homeVC,tableViewVC], animated: true)
    }

}
