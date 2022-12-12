//
//  TddLoginError.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/11/21.
//

import Foundation

enum TddLoginError: Error {
    case notEnoughInfo
    case idRequired
    case wrongPassword
}

extension TddLoginError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notEnoughInfo:
            return "아이디, 패스워드를 올바르게 입력하세요"
        case .idRequired:
            return "아이디를 입력하세요"
        case .wrongPassword:
            return "비밀번호가 잘못되었습니다"
        }
    }
}
