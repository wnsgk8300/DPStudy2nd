//
//  CombineWeatherViewController.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/10/19.
//

import UIKit
import Combine

class CombineWeatherViewController: UIViewController {
    
    let label = UILabel()
    let cityTextField = UITextField()
    
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        setUI()
        view.backgroundColor = .blue
        textFieldNotification()
    }
    func textFieldNotification() {
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: cityTextField)
        // object를 꺼내서 textfield라고 알려주고 text를 찾아서 percentEncoding(인코딩 방법 중 하나, url관련 작업할 때 사용하면 됨)으로 url인코딩함(공백이 %20으로 바뀜)
            .compactMap { ($0.object as! UITextField).text?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) }
            .sink { text in
                print(text)
            }
            .store(in: &cancellables)
    }

func runCombine() {
    WeatherServiceCombine().getWeather(city: "seoul")
    // Never를 안썼으니까 error도 처리를 해줘야함
        .sink(receiveCompletion:  { completion in
            switch completion {
                //touch event같이 이벤트가 끝이 없는 경우는 finished가 없다
            case .finished:
                print("finished")
                break
            case .failure(let error):
                print(error)
                break
            }
        },
              receiveValue: { weatherInfo in
            print(weatherInfo.main)
        })
        .store(in: &cancellables)
    
}
}

// MARK: - UI
extension CombineWeatherViewController {
    final private func setUI() {
        setBasics()
        setLayout()
    }
    final private func setBasics() {
        cityTextField.backgroundColor = .white
        
    }
    final private func setLayout() {
        [cityTextField, label].forEach {
            view.addSubview($0)
        }
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        cityTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(label.snp.bottom).offset(100)
            make.width.equalTo(300)
        }
    }
}
