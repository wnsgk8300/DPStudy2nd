//
//  CustomTableViewCell.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/08/01.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    let myTitle = UILabel()
    let mySubTitle = UILabel()
    let myImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(myTitle)
        contentView.addSubview(mySubTitle)
        contentView.addSubview(myImageView)
        myTitle.frame = CGRect(x: 12, y: 2, width: 0, height: 0)
        mySubTitle.frame = CGRect(x: 12, y: 20, width: 0, height: 0)
        myImageView.frame = CGRect(x: contentView.frame.maxX - 60,
                                   y: contentView.frame.midY - 12,
                                   width: 80,
                                   height: 24)
        mySubTitle.font = UIFont.systemFont(ofSize: 13)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
