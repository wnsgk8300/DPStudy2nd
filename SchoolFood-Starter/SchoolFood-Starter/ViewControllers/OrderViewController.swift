//
//  OrderViewController.swift
//  SchoolFood-Starter
//
//  Created by Doyoung Song on 8/2/22.
//

import UIKit

class OrderViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var orderTableView: UITableView!
    @IBOutlet weak var walletLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    var totalPrice = 0 {
        willSet { totalPriceLabel.text = "\(newValue.toDecimalFormat())원" }
    }
    
    var wallet = 0 {
        willSet { walletLabel.text = "\(newValue.toDecimalFormat())원"}
    }
    
    var balance: Int {
        return wallet - totalPrice
    }
    
    var quantities = [0, 0, 0, 0]
    
    // MARK: - Helpers
    @IBAction func didTapPayBarButtonItem(_ sender: UIBarButtonItem) {
        guard totalPrice > 0 else {
            present(UIAlertController.nothingToPay(), animated:  true)
            return
        }
        present(balance >= 0 ? paymentAlertController() : UIAlertController.insuffientMoney(balance: balance), animated: true)
    }
    
    @IBAction func didTapWalletBarButtonItem(_ sender: UIBarButtonItem) {
        present(rechargeAlertController(), animated: true)
    }
    
    @IBAction func didTapResetButton(_ sender: UIButton) {
        resetAll()
    }
    
    func resetAll() {
        totalPrice = 0
        wallet = 0
        quantities = [0, 0, 0, 0]
        orderTableView.reloadData()
    }
}

// MARK: - AlertControllers
extension OrderViewController {
    func paymentAlertController() -> UIAlertController {
        return UIAlertController.payment(totalPrice: totalPrice,
                                         handler: { [weak self] in
            guard let self = self else { return }
            let balance = self.balance
            self.resetAll()
            self.wallet = balance
        })
    }
    
    func rechargeAlertController() -> UIAlertController {
        return UIAlertController.recharge(handler: { [weak self] amount in
                self?.wallet += amount
        })
    }
}

// MARK: - OrderTableViewCellDelegate
extension OrderViewController: OrderTableViewCellDelegate {
    func didTapStepper(amount: Int, quantity: Int, tag: Int) {
        quantities[tag] = quantity
        totalPrice += amount
    }
}

// MARK: - UITableViewDataSource
extension OrderViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Menu.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath) as? OrderTableViewCell else { fatalError() }
        let menu = Menu.allCases[indexPath.row]
        let quantity = quantities[indexPath.row]
        cell.tag = indexPath.row
        cell.setData(menu: menu, quantity: quantity)
        cell.delegate = self
        return cell
    }
}
