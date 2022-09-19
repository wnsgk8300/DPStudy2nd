//
//  AsyncAwaitViewController.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/09/19.
//

import UIKit

class AsyncAwaitViewController: UIViewController {
    
    let label = UILabel()
    
    override func viewDidLoad() {
        setUI()
        //URLSession으로 실행
//        let result = AsyncAwaitNetworkService.shared.getQuotes() { result in
//            switch result {
//            case .success(let quotes):
//                print("Escaping: \(quotes)")
//            case .failure(let error):
//                print("Error: ", error)
//            }
//
//        }
//        print("Non-Escaping: \(result)")
        
        //await는 반드시 Task안에서 실행해야함
        Task {
            print("getQuotes1: ", await AsyncAwaitNetworkService.shared.getQuotes())
            print("getQuotes2: ", await AsyncAwaitNetworkService.shared.getQuotes2())
            print("getQuotes3: ", await AsyncAwaitNetworkService.shared.getQuotes3())
            print("getQuotes4: ", await AsyncAwaitNetworkService.shared.getQuotes4())
        }
        Task {
            print("continuationGetQuote: ", await AsyncAwaitNetworkService.shared.continuationGetQuote())
        }
        // Task Group도 나중에 할거임
    }
}

extension AsyncAwaitViewController {
    
}

// MARK: - UI
extension AsyncAwaitViewController {
    final private func setUI() {
        setBasics()
        setLayout()
    }
    final private func setBasics() {
        
    }
    final private func setLayout() {
        
    }
}
