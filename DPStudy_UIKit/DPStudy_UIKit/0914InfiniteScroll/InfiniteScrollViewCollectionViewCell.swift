//
//  InfiniteScrollViewCollectionViewCell.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/09/14.
//

import UIKit

class InfiniteScrollViewCollectionViewCell: UICollectionViewCell {
 
    static let identifier = "InfiniteScrollViewCollectionViewCustomCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
