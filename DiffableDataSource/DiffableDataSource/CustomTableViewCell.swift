//
//  CustomTableViewCell.swift
//  DiffableDataSource
//
//  Created by JEON JUNHA on 2023/01/02.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLable: UILabel!
    static let identifier = String(describing: CustomTableViewCell.self)

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(text: String) {
        titleLable.text = text
    }
    
}
