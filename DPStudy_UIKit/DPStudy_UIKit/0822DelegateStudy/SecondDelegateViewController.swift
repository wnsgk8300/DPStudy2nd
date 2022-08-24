//
//  SecondDelegateViewController.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/08/22.
//

import UIKit

// 프로토콜 만들고
protocol SecondViewControllerDelegate: AnyObject {
    func didDismiss(text: String)
}

class SecondDelegateViewController: UIViewController {
    
    let label = UILabel()
    
    // delegate 만들고
    weak var delegate: SecondViewControllerDelegate?
    
    override func viewDidLoad() {
        setUI()
    }
    deinit {
        delegate?.didDismiss(text: "Dismissed")
    }
}

// MARK: - UI
extension SecondDelegateViewController {
    final private func setUI() {
        setBasics()
        setLayout()
    }
    final private func setBasics() {
        
    }
    final private func setLayout() {
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
