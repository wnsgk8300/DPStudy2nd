//
//  WeatherInfoCombine.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/10/19.
//

import Foundation

struct WeatherInfoCombine: Decodable {
    
    let main: Main
    
    struct Main: Decodable {
        let temp: Double
        
    }
}
