//
//  ComponentViewController.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/08/03.
//

import UIKit

class ComponentViewController: UIViewController {
    
    let txtField = UITextField()
    let button = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        let image = UIImage(systemName: "gamecontroller")
        let imageView = UIImageView(image: image)
        navigationItem.titleView = imageView
        txtField.delegate = self
        
    }
    @objc
    func didTapButton(_ sender: UIButton) {
        let vc = SecondViewController()
        vc.label.text = txtField.text ?? "No Data"
        present(vc, animated: true)
    }
}

extension ComponentViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(textField.text)
        return true
    }
}

// MARK: - UI
extension ComponentViewController {
    final private func setUI() {
        setBasics()
        setLayout()
    }
    final private func setBasics() {
        
    }
    final private func setLayout() {
        view.addSubview(txtField)
        view.addSubview(button)
        txtField.frame = CGRect(x: view.frame.midX - 100, y: view.frame.midY - 130, width: 200, height: 40)
        txtField.layer.borderColor = UIColor.gray.cgColor
        txtField.layer.borderWidth = 0.5
        txtField.layer.cornerRadius = 20
        
//        button.frame = CGRect(x: txtField.frame.midX - 20, y: txtField.frame.midY + 30, width: 0, height: 0)
        button.setTitle("Next", for: .normal)
        button.sizeToFit()
        let btWidth = button.frame.width
        button.frame.origin = CGPoint(x: view.frame.midX - btWidth / 2, y: txtField.frame.midY + 40)
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    }
}


// Deleagate Pattern

