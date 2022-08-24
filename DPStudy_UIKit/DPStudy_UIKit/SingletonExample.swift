//
//  SingletonExample.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/08/24.
//

import Foundation

// Singleton
class DataManager {
    // VC마다 만들지 않고 같은 메모리 주소를 사용하기 위해서.
    static let shared = DataManager()
    
    var text = ""
    
    // 밖에서 DataManager를 새로 만들어 사용하지 못하도록 함.
    private init(){}
}


