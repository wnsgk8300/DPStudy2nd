//
//  AnimationAdvancedViewController.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/08/29.
//

import UIKit

class AnimationAdvancedViewController: UIViewController {
    
    let redView = UIView()
    let button = UIButton(type: .system)
    var topAnchor: NSLayoutConstraint?
    var leadingAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        setUI()
    }
}
extension AnimationAdvancedViewController {
    @objc
    func didTapButton(_ sender: UIButton) {
//        animate()
        animateKeyFrames()
    }
}

extension AnimationAdvancedViewController {
    func animateKeyFrames() {
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
    
    func animate() {
        // completion으로 view를 넘기는 등의 일을 사용할때 쓰면 됨
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: [],
                       animations: {
            self.leadingAnchor?.constant = self.view.frame.width - 80
            self.view.layoutIfNeeded()
        },
                       completion: { _ in
            UIView.animate(withDuration: 1,
                           delay: 0,
                           options: [],
                           animations: {
                self.topAnchor?.constant = self.view.frame.height - 140
                self.view.layoutIfNeeded()
            },
                           completion: { _ in
                UIView.animate(withDuration: 1,
                               delay: 0,
                               options: [],
                               animations: {
                    self.leadingAnchor?.constant = 20
                    self.view.layoutIfNeeded()
                },
                               completion: { _ in
                    UIView.animate(withDuration: 1,
                                   delay: 0,
                                   options: [],
                                   animations: {
                        self.topAnchor?.constant = 80
                        self.view.layoutIfNeeded()
                    },
                                   completion: { _ in }
                    )
                }
                )
            }
            )
        }
        )
        
    }
}
// MARK: - UI
extension AnimationAdvancedViewController {
    final private func setUI() {
        setBasics()
        setLayout()
    }
    final private func setBasics() {
        button.setTitle("Animate", for: .normal)
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    }
    final private func setLayout() {
        redView.backgroundColor = .red
        [redView, button].forEach {
            view.addSubview($0)
        }
        //        redView.translatesAutoresizingMaskIntoConstraints = false
        //        button.translatesAutoresizingMaskIntoConstraints = false
        topAnchor = redView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80)
        topAnchor?.isActive = true
        leadingAnchor = redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        leadingAnchor?.isActive = true
        
        
        redView.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.height.equalTo(60)
        }
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(60)
        }
        
    }
}
