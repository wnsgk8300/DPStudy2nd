//
//  NetworkError.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/09/07.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case badResponse
    case communicationError
    case decodeFailed
    case noData
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .badUrl:
            return "URL이 잘못됨"
        case .badResponse:
            return "response가 이상해요"
        case .communicationError:
            return ""
        case .decodeFailed:
            return ""
        case .noData:
            return ""
        }
    }
}
