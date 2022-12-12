//
//  PreprocessorViewController.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/10/24.
//

import UIKit

// 전처리
// 전처리됰 코드들은 상황에 따라 컴파일 여부를 정할 수 있다
// 시뮬레이터 선택 옆 버튼을 opt 클릭해서 info -> build configuration 을 원하는 대로 선택
// project build setting 에서 flag custom 에서 원하는 대로 설정
// flag는 여러개를 동시에 설정 가능함, degug/qa에 test를 추가하면 if의 test에서 둘 다 걸림

// target -> build setting 의 packaging -> bundle identifier를 변경하면 새로운 앱으로 설치됨
// product name설정으로 앱 이름 변경 가능

class PreprocessorViewController: UIViewController {
    
    var server = ""
    
    override func viewDidLoad() {
        
        #if TEST
        server = "test"
        #elseif DEBUG
        server = "server 3"
        print("debug")
        #elseif QA
        server = "QA"
        #else
        server = "server 10"
        print("release")
        #endif
        print(server)
        setUI()
    }
}

// MARK: - UI
extension PreprocessorViewController {
    final private func setUI() {
        setBasics()
        setLayout()
    }
    final private func setBasics() {
        
    }
    final private func setLayout() {
        
    }
}
