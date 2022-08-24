//
//  UserDefaultsViewController.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/08/24.
//

import UIKit

//UserDefaults는 대체적으로 100kb이하를 저장하는것에 최적화되어있다.
class UserDefaultsViewController: UIViewController {
    
    let label = UILabel()
    let button = UIButton(type: .system)
    
    override func viewDidLoad() {
        setUI()
    }
    @objc
    func didTapButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "", message: "텍스트 입력", preferredStyle: .alert)
        alert.addTextField()
        let confirmAction = UIAlertAction(title: "확인", style: .default) { _ in
            guard let text = alert.textFields?.first?.text else { return }
            self.label.text = text
            self.save(text: text)
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}
extension UserDefaultsViewController {
    func save(text: String) {
        UserDefaults.standard.set(text, forKey: "label")
    }
    
    func load() -> String {
        // UserDefaults에 [String] 저장
//        guard let obj = UserDefaults.standard.object(forKey: "object") as? [String] else { return "" }
        return UserDefaults.standard.string(forKey: "label") ?? ""
    }
}


// MARK: - UI
extension UserDefaultsViewController {
    final private func setUI() {
        setBasics()
        setLayout()
    }
    final private func setBasics() {
        label.text = load()
        button.setTitle("button", for: .normal)
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    }
    final private func setLayout() {
        view.addSubview(label)
        view.addSubview(button)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(label.snp.bottom).offset(60)
        }
    }
}
