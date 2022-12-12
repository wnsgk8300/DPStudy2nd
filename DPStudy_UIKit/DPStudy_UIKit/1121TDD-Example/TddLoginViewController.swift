////
////  TddLoginViewController.swift
////  DPStudy_UIKit
////
////  Created by JEON JUNHA on 2022/11/21.
////
//
//import UIKit
//
//// test driven develop
//class TddLoginViewController: UIViewController {
//    
//    let idTextField = UITextField()
//    let pwTextField = UITextField()
//    let loginButton = UIButton()
//    
//    override func viewDidLoad() {
//        setUI()
//        // test를 위해서는 설정해주어야 함
//        idTextField.accessibilityIdentifier = "idTextField"
//        pwTextField.accessibilityIdentifier = "pwTextField"
//        loginButton.accessibilityIdentifier = "loginButton"
//    }
//    @objc
//    private func didTapLoginButton(_ sender: UIButton) {
//        guard let id = idTextField.text,
//              let pw = pwTextField.text else {
//            showAlert(.notEnoughInfo)
//            return
//        }
//        guard !id.isEmpty else {
//            showAlert(.idRequired)
//            
//            
//        }
//        guard id == "Admin", pw == "Admin" else {
//            showAlert(.wrongPassword)
//            return
//        }
//        let nextVC = TddHomeViewController()
//        present(nextVC, animated: true)
//    }
//    func showAlert(_ error: TddLoginError) {
//        let alertController = UIAlertController(title: "경고", message: error.localizedDescription, preferredStyle: .alert)
//        let confirmAction = UIAlertAction(title: "확인", style: .default)
//        alertController.addAction(confirmAction)
//        present(alertController, animated: true)
//    }
//}
//
//// MARK: - UI
//extension TddLoginViewController {
//    final private func setUI() {
//        setBasics()
//        setLayout()
//    }
//    final private func setBasics() {
//        loginButton.addTarget(self, action: #selector(didTapLoginButton(_:)), for: .touchUpInside)
//        idTextField.backgroundColor = .white
//        pwTextField.backgroundColor = .white
//        loginButton.setTitle("button", for: .normal)
//    }
//    final private func setLayout() {
//        [idTextField, pwTextField, loginButton].forEach {
//            view.addSubview($0)
//        }
//        idTextField.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.centerY.equalToSuperview().offset(-200)
//            make.width.equalTo(300)
//            make.height.equalTo(40)
//        }
//        pwTextField.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.centerY.equalTo(idTextField.snp.bottom).offset(40)
//            make.height.width.equalTo(idTextField)
//        }
//        loginButton.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.centerY.equalTo(pwTextField.snp.bottom).offset(20)
//            make.height.width.equalTo(200)
//        }
//    }
//}
