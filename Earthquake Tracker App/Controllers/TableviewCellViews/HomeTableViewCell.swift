//
//  HomeTableViewCell.swift
//  Earthquake Tracker App
//
//  Created by Mutlu Çalkan on 22.06.2022.
//

import UIKit
import SnapKit

class HomeTableViewCell: UITableViewCell {
    
    static let identifier = "TableViewCell"
    
    let properties = HomeVcCellComponents()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(properties.magnitudeLabel)
        contentView.addSubview(properties.cityLabel)
        contentView.addSubview(properties.depthLabel)
        contentView.addSubview(properties.dateLabel)
        contentView.addSubview(properties.timeLabel)
        contentView.addSubview(properties.image)
        
        cellConstraints()
    }
    
    func cellConstraints(){
        properties.magnitudeLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(contentView).offset(25)
            make.width.equalTo(50)
        }
        properties.image.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(28)
            make.right.equalTo(contentView).offset(-28)
            make.bottom.equalTo(contentView).offset(-28)
            make.width.equalTo(26)
            
        }
        properties.cityLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.left.equalTo(properties.magnitudeLabel.snp_rightMargin).offset(25)
            make.right.equalTo(properties.image.snp_leftMargin).offset(-25)
        }
        properties.depthLabel.snp.makeConstraints { make in
            make.top.equalTo(properties.cityLabel.snp_bottomMargin).offset(10)
            make.left.equalTo(properties.magnitudeLabel.snp_rightMargin).offset(25)
            make.right.equalTo(properties.image.snp_leftMargin).offset(-25)
        }
        properties.dateLabel.snp.makeConstraints { make in
            make.top.equalTo(properties.depthLabel.snp_bottomMargin).offset(10)
            make.left.equalTo(properties.magnitudeLabel.snp_rightMargin).offset(25)
            make.bottom.equalTo(contentView).offset(-10)
        }
        properties.timeLabel.snp.makeConstraints { make in
            make.top.equalTo(properties.depthLabel.snp_bottomMargin).offset(10)
            make.left.equalTo(properties.dateLabel.snp_rightMargin).offset(5)
            make.right.equalTo(properties.image.snp_leftMargin).offset(-25)
            make.bottom.equalTo(contentView).offset(-10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
