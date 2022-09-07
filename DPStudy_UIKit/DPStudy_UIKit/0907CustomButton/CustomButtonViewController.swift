//
//  CustomButtonViewController.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/09/07.
//

import UIKit

class CustomButtonViewController: UIViewController {
    
    let mainLogoButton = CustomLongButton(title: "Logo")
    let mainLogoButtons:[UIButton] = ["Logo", "Logo2", "Logo3"].map { title in
        return CustomLongButton(title: title)
    }
    
    override func viewDidLoad() {
        setUI()
    }
}

// MARK: - UI
extension CustomButtonViewController {
    final private func setUI() {
        setBasics()
        setLayout()
    }
    final private func setBasics() {

    }
    final private func setLayout() {
        view.addSubview(mainLogoButton)
        mainLogoButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        mainLogoButtons.forEach {
            view.addSubview($0)
        }
        for (index, button) in mainLogoButtons.enumerated() {
            if index == 0 {
                button.snp.makeConstraints { make in
                    make.center.equalTo(mainLogoButton.snp.bottom).offset(40)
                }
            }
//            else if index == 1 {
//                view.addSubview(button)
//                button.snp.makeConstraints { make in
//                    make.center.equalTo(mainLogoButtons[index - 1].snp.bottom).offset(40)
//                }
//            }
        }
    }
}
