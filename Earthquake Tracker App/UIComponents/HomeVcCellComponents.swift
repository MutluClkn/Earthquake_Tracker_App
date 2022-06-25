//
//  HomeVcCellComponents.swift
//  Earthquake Tracker App
//
//  Created by Mutlu Çalkan on 22.06.2022.
//

import Foundation
import UIKit

struct HomeVcCellComponents {
    
    //MARK: - Tableview Cell UI Components
    
    public let magnitudeLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1.4"
        label.font = .systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    public let cityLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Atakum (Samsun)"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textAlignment = .left
        return label
    }()
    
    public let depthLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Depth: 7.84 km"
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textAlignment = .left
        return label
    }()
    
    public let dateLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "25.06.2022"
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textAlignment = .left
        return label
    }()
    
    public let timeLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "13:28:16"
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textAlignment = .left
        return label
    }()
    
    public let image : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "location.circle")
        image.tintColor = UIColor(named: "locationImageColor")
       // image.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
}
