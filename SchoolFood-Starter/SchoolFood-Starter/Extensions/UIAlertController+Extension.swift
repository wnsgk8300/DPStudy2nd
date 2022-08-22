//
//  UIAlertController+Extension.swift
//  SchoolFood-Starter
//
//  Created by Doyoung Song on 8/4/22.
//

import UIKit

extension UIAlertController {
    
    static func nothingToPay() -> UIAlertController {
        let alertController = UIAlertController(title: "상품 없음", message: "먼저 상품을 추가하세요", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default)
        alertController.addAction(confirmAction)
        return alertController
    }
    
    static func insuffientMoney(balance: Int) -> UIAlertController {
        let alertController = UIAlertController(title: "잔액 부족", message: "\(abs(balance).toDecimalFormat())원이 모자랍니다", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default)
        alertController.addAction(confirmAction)
        return alertController
    }
    
    static func payment(totalPrice: Int, handler: @escaping () -> Void) -> UIAlertController {
        let alertController = UIAlertController(title: "결제", message: "총 \(totalPrice.toDecimalFormat())원을 결제 하시겠습니까?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        let confirmAction = UIAlertAction(title: "확인", style: .default) { _ in handler() }
        alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)
        return alertController
    }
    
    static func recharge(handler: @escaping (Int) -> Void) -> UIAlertController {
        let alertController = UIAlertController(title: "지갑", message: "얼마를 충전할까요?", preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.keyboardType = .numberPad
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        let confirmAction = UIAlertAction(title: "확인", style: .default) { _ in
            guard let text = alertController.textFields?.first?.text,
                  let amount = Int(text) else { return }
            handler(amount)
        }
        alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)
        return alertController
    }
}
