//
//  JKDetailViewController.swift
//  TestProject
//
//  Created by JackYoung on 2020/12/2.
//  Copyright © 2020 JackYoung. All rights reserved.
//

import UIKit

class JYDetailViewController: UIViewController {

    var content : String?
    lazy var contentTextView : UITextView  = {
        let textView = UITextView()
        textView.backgroundColor = UIColor.white
        textView.font = UIFont.systemFont(ofSize: 12)
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Detail"
        
        self.view.addSubview(self.contentTextView)
        self.contentTextView.mas_remakeConstraints { (make) in
            make?.left.equalTo()(20)
            make?.right.equalTo()(-20)
            make?.bottom.equalTo()(self.view.mas_bottom)?.offset()(-20)
            make?.top.equalTo()(self.view.mas_top)?.offset()(isIphoneX ? 88 : 64)
        }
        
        if content != nil {
            self.contentTextView.text = content!
        }
    }
}
