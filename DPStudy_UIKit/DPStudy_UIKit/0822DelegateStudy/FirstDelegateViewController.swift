//
//  FirstDelegateViewController.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/08/22.
//

import UIKit

class FirstDelegateViewController: UIViewController {
    
    let label = UILabel()
    
    override func viewDidLoad() {
        setUI()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let vc = SecondDelegateViewController()
        vc.label.text = "Second!"
        vc.delegate = self
        present(vc, animated: true)
    }
}

extension FirstDelegateViewController: SecondViewControllerDelegate {
    func didDismiss(text: String) {
        label.text = text
    }
    
    
}

// MARK: - UI
extension FirstDelegateViewController {
    final private func setUI() {
        setBasics()
        setLayout()
    }
    final private func setBasics() {
        label.text = "First!"
    }
    final private func setLayout() {
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
