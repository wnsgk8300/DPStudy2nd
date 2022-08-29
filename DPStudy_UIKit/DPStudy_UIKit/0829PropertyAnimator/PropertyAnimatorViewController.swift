//
//  PropertyAnimatorViewController.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/08/29.
//

import UIKit

class PropertyAnimatorViewController: UIViewController {
    
    enum Button: String, CaseIterable {
        case start
        case pause
        case stop
    }
    
    private let redView = UIView()
    private let stackView = UIStackView()
    
    private var animator: UIViewPropertyAnimator?
    
    private var topAnchor: NSLayoutConstraint?
    private var leadingAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        setUI()
    }
}
extension PropertyAnimatorViewController {
    @objc
    func didTapButton(_ sender: UIButton) {
        switch sender.titleLabel?.text {
        case Button.start.rawValue:
            startAnimation()
        case Button.stop.rawValue:
            stopAnimation()
        case Button.pause.rawValue:
            pauseAnimation()
        default:
            fatalError()
        }
    }
    private func startAnimation() {
        if animator == nil {
            animator = UIViewPropertyAnimator(duration: 4, timingParameters: UICubicTimingParameters())
            animator?.addAnimations {
                UIView.animateKeyframes(withDuration: 4, // animate가 총 4초 걸림
                                        delay: 0,
                                        animations: {
                    UIView.addKeyframe(withRelativeStartTime: 0, // 0~1
                                       relativeDuration: 0.25, // 0~1
                                       animations: {
                        self.leadingAnchor?.constant = self.view.frame.width - 80
                        self.view.layoutIfNeeded()
                    })
                                       // 총 Duration의 퍼센트라고 보면 됨
                    UIView.addKeyframe(withRelativeStartTime: 0.25, // 0~1
                                       relativeDuration: 0.25, // 0~1
                                       animations: {
                        self.topAnchor?.constant = self.view.frame.height - 140
                        self.view.layoutIfNeeded()
                    })
                    UIView.addKeyframe(withRelativeStartTime: 0.5, // 0~1
                                       relativeDuration: 0.25, // 0~1
                                       animations: {
                        self.leadingAnchor?.constant = 20
                        self.view.layoutIfNeeded()
                    })
                    UIView.addKeyframe(withRelativeStartTime: 0.75, // 0~1
                                       relativeDuration: 0.25, // 0~1
                                       animations: {
                        self.topAnchor?.constant = 80
                        self.view.layoutIfNeeded()
                    })
                })
            }
        }
        animator?.startAnimation()
    }
    private func stopAnimation() {
        animator?.stopAnimation(false)
        animator?.finishAnimation(at: .current)
        animator = nil
        topAnchor?.constant = 80
        leadingAnchor?.constant = 20
        view.setNeedsLayout()
    }
    private func pauseAnimation() {
        animator?.pauseAnimation()
    }
}

// MARK: - UI
extension PropertyAnimatorViewController {
    final private func setUI() {
        setBasics()
        setLayout()
    }
    final private func setBasics() {
        redView.backgroundColor = .red
        
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
    }
    final private func setLayout() {
        [redView, stackView].forEach {
            view.addSubview($0)
        }
        Button.allCases.forEach {
            let button = UIButton(type: .system)
            button.setTitle($0.rawValue, for: .normal)
            button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }
        topAnchor = redView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80)
        topAnchor?.isActive = true
        leadingAnchor = redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        leadingAnchor?.isActive = true
        
        redView.snp.makeConstraints { make in
            make.width.height.equalTo(60)
        }
        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(60)
            make.width.equalTo(view.frame.width - 40)
        }
    }
}
