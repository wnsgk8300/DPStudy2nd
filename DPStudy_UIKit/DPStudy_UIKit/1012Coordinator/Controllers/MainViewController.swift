//
//  MainViewController.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/10/12.
//

import UIKit

protocol MainViewControllerDelegate {
    func logout()
}

class MainViewController: UIViewController {
    
    var delegate: MainViewControllerDelegate?
    
    override func viewDidLoad() {
        let barButtonItem = UIBarButtonItem(title: "로그아웃", style: .plain, target: self, action: #selector(tapButton(_:)))
        navigationItem.rightBarButtonItem = barButtonItem
        setUI()
    }
    
    @objc
    func tapButton(_ sender: UIButton) {
        delegate?.logout()
    }
}

// MARK: - UI
extension MainViewController {
    final private func setUI() {
        setBasics()
        setLayout()
    }
    final private func setBasics() {
        
    }
    final private func setLayout() {
        
    }
}
