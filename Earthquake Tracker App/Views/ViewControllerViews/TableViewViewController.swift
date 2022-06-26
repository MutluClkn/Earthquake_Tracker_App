//
//  TableViewViewController.swift
//  Earthquake Tracker App
//
//  Created by Mutlu Çalkan on 25.06.2022.
//

import UIKit

class TableViewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // UI Component
    let tableView : UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    // MARK: - TableView Settings
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else{ return UITableViewCell()}
        return cell
    }
    
}
