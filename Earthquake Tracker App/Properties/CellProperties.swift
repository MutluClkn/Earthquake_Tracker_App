//
//  CellProperties.swift
//  Earthquake Tracker App
//
//  Created by Mutlu Çalkan on 22.06.2022.
//

import Foundation
import UIKit

struct CellProperties {
    public let magnitudeLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "TEST"
        return label
    }()
}
