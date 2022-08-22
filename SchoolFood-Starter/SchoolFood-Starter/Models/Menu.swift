//
//  Menu.swift
//  SchoolFood-Starter
//
//  Created by Doyoung Song on 8/2/22.
//

import UIKit

enum Menu: String, CaseIterable {
    
    case specailmari
    case bibimbap
    case jjolmyeon
    case tteokbokki
    
    var image: UIImage? {
        return UIImage(named: self.rawValue)
    }
    
    var title: String {
        switch self {
        case .specailmari:
            return "스페셜마리"
        case .bibimbap:
            return "불맛 중화비빔밥"
        case .jjolmyeon:
            return "어간장 육감쫄면"
        case .tteokbokki:
            return "의성 마늘떡볶이"
        }
    }
    
    var price: Int {
        switch self {
        case .specailmari:
            return 7500
        case .bibimbap:
            return 8500
        case .jjolmyeon:
            return 8000
        case .tteokbokki:
            return 9000
        }
    }
    
    var priceTag: String {
        return "\(price.toDecimalFormat())원"
    }
}
