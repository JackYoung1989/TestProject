//
//  JYHistoryViewController.swift
//  TestProject
//
//  Created by JackYoung on 2020/12/2.
//  Copyright © 2020 JackYoung. All rights reserved.
//

import UIKit

class JYHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let kJYDetailViewControllerCellKey = "kJYDetailViewControllerCellKey"
    lazy var tableView : UITableView  = {
        let tableView = UITableView(frame: CGRect.zero, style: .plain)
        tableView.backgroundColor = UIColor.red
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green
        
        self.view.addSubview(self.tableView)
        self.tableView.mas_remakeConstraints { (make) in
            make?.left.equalTo()(0)
            make?.right.equalTo()(0)
            make?.bottom.equalTo()(self.view.mas_bottom)?.offset()(0)
            make?.top.equalTo()(self.view.mas_top)?.offset()(0)
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: kJYDetailViewControllerCellKey)
        if cell == nil {
            cell = JYTableViewCell(style: .default, reuseIdentifier: kJYDetailViewControllerCellKey)
        }
        
        return cell ?? JYTableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
}
