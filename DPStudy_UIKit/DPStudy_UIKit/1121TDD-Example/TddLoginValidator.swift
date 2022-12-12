//
//  TddLoginValidator.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/11/21.
//

import Foundation

class TddLoginValidator {
    func isValid(id: String) -> Bool {
        return id.count > 3
    }
    func isValidPw(pw: String) -> Bool {
        return pw.count >= 5
    }
    func shouldLogin(user: TddUser, completion: @escaping (Bool) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {completion(self.isValid(id: user.id) && self.isValidPw(pw: user.pw))
        })
    }
}
