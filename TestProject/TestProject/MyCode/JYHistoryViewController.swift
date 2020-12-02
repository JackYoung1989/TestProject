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
    var historyArray = [JKModel]()
    
    lazy var tableView : UITableView  = {
        let tableView = UITableView(frame: CGRect.zero, style: .plain)
        tableView.backgroundColor = UIColor.white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(JYTableViewCell.classForCoder(), forCellReuseIdentifier: kJYDetailViewControllerCellKey)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green
        self.navigationItem.title = "HistoryList"
        
        self.view.addSubview(self.tableView)
        self.tableView.mas_remakeConstraints { (make) in
            make?.left.equalTo()(0)
            make?.right.equalTo()(0)
            make?.bottom.equalTo()(self.view.mas_bottom)?.offset()(0)
            make?.top.equalTo()(self.view.mas_top)?.offset()(0)
        }
        
        if self.historyArray.count > 0 {
            self.tableView.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : JYTableViewCell = tableView.dequeueReusableCell(withIdentifier: kJYDetailViewControllerCellKey) as? JYTableViewCell ?? JYTableViewCell()
        
        if historyArray.count > indexPath.row {
            cell.fillCell(model: historyArray[indexPath.row])
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
