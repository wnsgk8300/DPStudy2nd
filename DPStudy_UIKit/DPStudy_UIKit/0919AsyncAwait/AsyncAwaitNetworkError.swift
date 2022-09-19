//
//  AsyncAwaitNetworkError.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/09/19.
//

import Foundation
enum AsyncAwaitNetworkError: Error {
    case badResponse
    case communicationError
    case decodeFailed
    case noData
}

