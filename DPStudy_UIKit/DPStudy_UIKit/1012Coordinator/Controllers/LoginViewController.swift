//
//  CoordinatorViewController.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/10/12.
//

import UIKit

protocol LoginViewControllerDelegate {
    func login()
}

class LoginViewController: UIViewController {
    
    var delegate: LoginViewControllerDelegate?
    
    override func viewDidLoad() {
        let barButtonItem = UIBarButtonItem(title: "로그인", style: .plain, target: self, action: #selector(tapButton(_:)))
        navigationItem.rightBarButtonItem = barButtonItem
        setUI()
    }
    @objc
    func tapButton(_ sender: UIButton) {
        delegate?.login()
    }
    deinit {
        print(#function)
    }
}

// MARK: - UI
extension LoginViewController {
    final private func setUI() {
        setBasics()
        setLayout()
    }
    final private func setBasics() {
        
    }
    final private func setLayout() {
        
    }
}
