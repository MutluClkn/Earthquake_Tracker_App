//
//  HomeViewController.swift
//  Earthquake Tracker App
//
//  Created by Mutlu Çalkan on 22.06.2022.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let properties = HomeProperties()
    
    let tableView : UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        return tv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(properties.topView)
        view.addSubview(properties.bottomView)
        properties.topView.addSubview(properties.magnitudeLabel)
        properties.topView.addSubview(properties.topViewImage)
        properties.topView.addSubview(properties.depthLabel)
        properties.topView.addSubview(properties.cityLabel)
        properties.bottomView.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        constraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = properties.topView.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else{ return UITableViewCell()}
        
        return cell
    }
    
    func constraints(){
        properties.topView.snp.makeConstraints { make in
            make.left.equalTo(view)
            make.right.equalTo(view)
            make.top.equalTo(view)
            make.height.equalTo(view.frame.height/2)
        }
        
        properties.bottomView.snp.makeConstraints { make in
            make.left.equalTo(view)
            make.right.equalTo(view)
            make.bottom.equalTo(view)
            make.top.equalTo(properties.topView.snp_bottomMargin)
        }
        
        properties.topViewImage.snp.makeConstraints { make in
            make.top.equalTo(properties.topView)
            make.left.equalTo(properties.topView)
            make.right.equalTo(properties.topView)
            make.bottom.equalTo(properties.topView.snp_bottomMargin).offset(-100)
        }
        
        properties.magnitudeLabel.snp.makeConstraints { make in
            make.centerX.equalTo(properties.topViewImage.snp_centerXWithinMargins)
            make.centerY.equalTo(properties.topViewImage.snp_centerYWithinMargins)
        }
        
        properties.depthLabel.snp.makeConstraints { make in
            make.top.equalTo(properties.topViewImage.snp_bottomMargin).offset(5)
            make.left.equalTo(properties.topView).offset(5)
            make.bottom.equalTo(properties.topView).offset(-5)
            make.right.equalTo(properties.magnitudeLabel.snp_centerXWithinMargins)
            
        }
        
        properties.cityLabel.snp.makeConstraints { make in
            make.centerY.equalTo(properties.depthLabel.snp_centerYWithinMargins)
            make.right.equalTo(properties.topView).offset(-5)
            make.left.equalTo(properties.depthLabel.snp_rightMargin)
            
        }
    }
}

