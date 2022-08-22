//
//  SecondViewController.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/08/03.
//

import UIKit

class SecondViewController: UIViewController {
    
    let label = UILabel()
    let button = UIButton(type: .system)
    
    override func viewDidLoad() {
        setUI()
        view.backgroundColor = .systemBackground
    }
    
    @objc
    func didTapButton(_ sender: UIButton) {
        let alertController = UIAlertController(title: "경고", message: "마지막 화면입니다.", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        let okACtion = UIAlertAction(title: "확인", style: .default) { _ in
            print("\(String(describing: alertController.textFields?.first?.text))")
        }
        alertController.addAction(cancelAction)
        alertController.addAction(okACtion)
        alertController.addTextField { textField in
            textField.keyboardType = .numberPad
        }
        self.present(alertController, animated: true)
    }
}

// MARK: - UI
extension SecondViewController {
    final private func setUI() {
        setBasics()
        setLayout()
    }
    final private func setBasics() {
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    }
    final private func setLayout() {
        view.addSubview(label)
        label.frame = CGRect(x: view.frame.midX - 100, y: view.frame.midY - 20, width: 200, height: 40)
        label.layer.borderColor = UIColor.gray.cgColor
        label.layer.borderWidth = 0.5
        label.layer.cornerRadius = 4
//        label.text = "이곳에 데이터 들어옴"
        label.textAlignment = .center
        
        view.addSubview(button)
        button.setTitle("Alert", for: .normal)
        button.sizeToFit()
        let buttonWidth = button.frame.width
        button.frame.origin = CGPoint(x: view.frame.midX - buttonWidth / 2, y: view.frame.midY + 40)
        
    }
}
