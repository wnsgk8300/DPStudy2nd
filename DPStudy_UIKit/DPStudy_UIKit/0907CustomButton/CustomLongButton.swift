//
//  CustomLongButton.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/09/07.
//

import UIKit


class CustomLongButton: UIButton {
    init(title: String) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension CustomLongButton {
    private func setUI() {
        setTitle("Logo", for: .normal)
        layer.cornerRadius = 4
        layer.borderColor = UIColor.systemBlue.cgColor
        layer.borderWidth = 1
        self.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.height.equalTo(40)
        }
    }
}
