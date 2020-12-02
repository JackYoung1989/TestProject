//
//  JYTableViewCell.swift
//  TestProject
//
//  Created by JackYoung on 2020/12/2.
//  Copyright © 2020 JackYoung. All rights reserved.
//

import UIKit

class JYTableViewCell: UITableViewCell {

    lazy var keyLabel : UILabel  = {
        let label = UILabel()
        label.backgroundColor = UIColor.clear
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    lazy var valueLabel : UILabel  = {
        let label = UILabel()
        label.backgroundColor = UIColor.clear
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    required override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(self.keyLabel)
        self.keyLabel.mas_remakeConstraints { (make) in
            make?.left.equalTo()(10)
            make?.centerY.equalTo()(0)
            make?.width.equalTo()(100)
            make?.height.equalTo()(20)
        }
        
        self.contentView.addSubview(self.valueLabel)
        self.valueLabel.mas_remakeConstraints { (make) in
            make?.left.equalTo()(120)
            make?.centerY.equalTo()(0)
            make?.right.equalTo()(-10)
            make?.height.equalTo()(20)
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fillCell(model : JKModel) {
        self.keyLabel.text = "time is :"
        self.valueLabel.text = model.time
    }
}
