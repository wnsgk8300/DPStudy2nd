//
//  URLSessionViewController.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/08/31.
//

import UIKit

class URLSessionViewController: UIViewController {
    
    let tempLabel = UILabel()
    
    override func viewDidLoad() {
        setUI()
        NetworkService.shared.fetch(urlString: URL.weather) { weatherInfo in
            self.tempLabel.text = String(weatherInfo.main.temp)
            self.tempLabel.text = weatherInfo.weather.first?.main
        }
    }
}

extension URLSessionViewController {

}

// MARK: - UI
extension URLSessionViewController {
    final private func setUI() {
        setBasics()
        setLayout()
    }
    final private func setBasics() {
        tempLabel.text = "0"
    }
    final private func setLayout() {
        [tempLabel].forEach {
            view.addSubview($0)
        }
        tempLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
