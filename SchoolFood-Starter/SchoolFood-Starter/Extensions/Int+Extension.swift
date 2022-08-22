//
//  Int+Extension.swift
//  SchoolFood-Starter
//
//  Created by Doyoung Song on 8/2/22.
//

import Foundation

extension Int {
    
    func toDecimalFormat() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        guard let price = formatter.string(for: self) else {
            return "Formatting Error"
        }
        return price
    }
}
