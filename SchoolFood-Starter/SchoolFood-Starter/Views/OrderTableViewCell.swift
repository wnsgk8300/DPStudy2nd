//
//  OrderTableViewCell.swift
//  SchoolFood-Starter
//
//  Created by Doyoung Song on 8/2/22.
//

import UIKit

protocol OrderTableViewCellDelegate: AnyObject {
    func didTapStepper(amount: Int, quantity: Int, tag: Int)
}

class OrderTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var quantityStepper: UIStepper!
    
    weak var delegate: OrderTableViewCellDelegate?
    
    private var menu: Menu?
    
    var quantity = 0 {
        willSet { countLabel.text = String(newValue) + "개" }
    }

    // MARK: - Helpers
    @IBAction func didTapStepper(_ sender: UIStepper) {
        guard let price = menu?.price else { return }
        let amount = price  * (Int(sender.value) - quantity)
        quantity = Int(sender.value)
        delegate?.didTapStepper(amount: amount, quantity: quantity, tag: tag)
    }
    
    func setData(menu: Menu, quantity: Int) {
        self.menu = menu
        self.quantity = quantity
        quantityStepper.value = Double(quantity)
        mainImageView.image = menu.image
        titleLabel.text = menu.title
        priceLabel.text = menu.priceTag
    }
}
