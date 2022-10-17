//
//  CombineViewController.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/10/17.
//

import UIKit
import Combine

class CombineViewController: UIViewController {
    
    private let viewModel = CombineViewModel()
  
    let quoteLabel = UILabel()
    let button = UIButton()
    // 대충 찌꺼기라고 생각하면 됨, 애플 공식 예제가 Set이라 그냥 Set임
    var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        setUI()
        view.backgroundColor = .red
        combine2()
    }
    
    private func combine2() {
        // sink 는 AnyCancellable을 return함
        viewModel.content
            .receive(on: DispatchQueue.main)
            .map{ Optional($0) }
            .assign(to: \.quoteLabel.text, on: self) // keypath Expression
        //항상 찌꺼기를 저장해야함
        .store(in: &cancellables)
    }
    
//    private func combine() {
//        // sink 는 AnyCancellable을 return함
//        content.sink { content in
//            self.quoteLabel.text = content
//        }
//        //항상 찌꺼기를 저장해야함
//        .store(in: &cancellables)
//    }
    
    
    @objc
    private func tapCombineButton(_ sender: UIButton) {
        viewModel.request()
    }
    
    @objc
    private func tapButton(_ sender: UIButton) {
        print("tapped")
        CombineAPIService().getCombineQuote { result in
            switch result {
            case .success(let quote):
                self.quoteLabel.text = quote.content
            case .failure(let error):
                self.quoteLabel.text = "\(error)"
            }
        }
    }
}

// MARK: - UI
extension CombineViewController {
    final private func setUI() {
        setBasics()
        setLayout()
    }
    final private func setBasics() {
        button.setTitle("컴바인버튼", for: .normal)
//        button.addTarget(self, action: #selector(tapButton(_:)), for: .touchUpInside)
        button.addTarget(self, action: #selector(tapCombineButton(_:)), for: .touchUpInside)
        quoteLabel.numberOfLines = 0
    }
    final private func setLayout() {
        [quoteLabel, button].forEach {
            view.addSubview($0)
        }
        quoteLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(200)
        }
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(quoteLabel.snp.bottom).offset(100)
        }
    }
}


/*
 지금까지의 방식
 API요청 버튼
 -> API 호출
 -> Data 받고
 -> callback - completion handler : Data 받은 것을 보장
 -> UI Update
 
 Combine
 Publisher: Data 방출
    - PassthroughSubject: 값을 저장하지 않음
    - CurrentValueSubject: 값을 저장함
 Subscriber: 방출된 데이터 구독
    - sink: sink 하는 순간 subscribe됨
 
 URLSession
 NotificationCenter
 Callblack
 GCD
 Delegate
 위 5가지를 Combine이 어느정도 대체할 수 있다.
 
 DataPublisher
 
 let a = DP.sink()
 requestData()
 let b = DP.sink()
 a가 paathrough 면 b는 값을 못받고
 a가 current로 저장되면 값을 받을 수 있다.
 */
