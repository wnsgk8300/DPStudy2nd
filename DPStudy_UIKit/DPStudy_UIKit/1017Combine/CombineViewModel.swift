//
//  CombineViewModel.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/10/17.
//

import Foundation
import Combine

class CombineViewModel {
    
    // Never: 에러 절대 발생 안함
    var content = PassthroughSubject<String, Never>()
    
    func request() {
        Task {
            let quote = try await CombineAPIService().getQuote()
            content.send(quote.content)
        }
    }
}
