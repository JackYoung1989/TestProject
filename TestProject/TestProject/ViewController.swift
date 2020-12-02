//
//  ViewController.swift
//  TestProject
//
//  Created by JackYoung on 2020/12/1.
//  Copyright © 2020 JackYoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton()
        button.backgroundColor = UIColor.red
        button.setTitle("历史记录", for: .normal)
        button.addTarget(self, action: #selector(historyButtonTouched), for: .touchUpInside)
            
        
    }
    
    @objc func historyButtonTouched() {
        
    }

}

