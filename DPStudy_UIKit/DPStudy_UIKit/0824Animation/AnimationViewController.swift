//
//  AnimationViewController.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/08/24.
//

import UIKit

class AnimationViewController: UIViewController {
    
    let redView = UIView()
    let button = UIButton(type: .system)
    var redViewUpperAnchor: NSLayoutConstraint?
    var redViewLowerAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        setUI()
    }
}

extension AnimationViewController {
    @objc
    func didTapButton(_ sender: UIButton) {
        UIView.animate(withDuration: 2, delay: 0, options: [.repeat, .autoreverse], animations: {
//            self.redViewUpperAnchor?.constant = 600
            self.redViewLowerAnchor?.priority = .required // 1000
            // snapkit이면 snp.updateContrants로 가능함
//            self.redView.snp.updateConstraints { makec
            self.redView.alpha = 0.2
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}

// MARK: - UI
extension AnimationViewController {
    final private func setUI() {
        setBasics()
        setLayout()
    }
    final private func setBasics() {
        redView.backgroundColor = .red
        redView.alpha = 1
        button.setTitle("Animation", for: .normal)
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    }
    final private func setLayout() {
        view.addSubview(redView)
        view.addSubview(button)
        
        // priority 0...1000, 기본값은 1000
        // required: 1000, high: 750, low: 250
        redViewUpperAnchor = redView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80)
        redViewUpperAnchor?.priority = .defaultHigh //750

        redViewLowerAnchor = redView.topAnchor.constraint(equalTo: view.topAnchor, constant: 600)
        redViewLowerAnchor?.priority = .defaultLow //250
        
        redViewUpperAnchor?.isActive = true
        redViewLowerAnchor?.isActive = true
        
        redView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
//            make.top.equalToSuperview().offset(80)
            make.width.height.equalTo(60)
        }
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-80)
        }
    }
}
