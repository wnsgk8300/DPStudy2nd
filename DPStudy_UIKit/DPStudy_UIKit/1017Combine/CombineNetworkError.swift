//
//  CombineNetworkError.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/10/17.
//

import Foundation

enum CombineNetworkError: Error {
    case badURL
    case badResponse
    case communicationError
    case decodedFailed
    case noData
}
