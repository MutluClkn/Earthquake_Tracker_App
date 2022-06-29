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
    
    //MARK: - Tableview Cell UI Components
    
    public var magnitudeLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1.4"
        label.font = .systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    public var cityLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Atakum (Samsun)"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textAlignment = .left
        return label
    }()
    
    public var depthLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Depth: 7.84 km"
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textAlignment = .left
        return label
    }()
    
    public var dateLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "25.06.2022"
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textAlignment = .left
        return label
    }()
    
    public var timeLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "13:28:16"
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textAlignment = .left
        return label
    }()
    
    public var image : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "location.circle")
        image.tintColor = UIColor(named: "locationImageColor")
       // image.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(magnitudeLabel)
        contentView.addSubview(cityLabel)
        contentView.addSubview(depthLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(image)
        
        cellConstraints()
    }
    
    func cellConstraints(){
        magnitudeLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(contentView).offset(25)
            make.width.equalTo(50)
        }
        image.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(28)
            make.right.equalTo(contentView).offset(-28)
            make.bottom.equalTo(contentView).offset(-28)
            make.width.equalTo(26)
            
        }
        cityLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.left.equalTo(magnitudeLabel.snp_rightMargin).offset(25)
            make.right.equalTo(image.snp_leftMargin).offset(-25)
        }
        depthLabel.snp.makeConstraints { make in
            make.top.equalTo(cityLabel.snp_bottomMargin).offset(10)
            make.left.equalTo(magnitudeLabel.snp_rightMargin).offset(25)
            make.right.equalTo(image.snp_leftMargin).offset(-25)
        }
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(depthLabel.snp_bottomMargin).offset(10)
            make.left.equalTo(magnitudeLabel.snp_rightMargin).offset(25)
            make.bottom.equalTo(contentView).offset(-10)
        }
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(depthLabel.snp_bottomMargin).offset(10)
            make.left.equalTo(dateLabel.snp_rightMargin).offset(5)
            make.right.equalTo(image.snp_leftMargin).offset(-25)
            make.bottom.equalTo(contentView).offset(-10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
