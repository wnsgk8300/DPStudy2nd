//
//  WeatherInfo.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/08/31.
//

import Foundation

struct WeatherInfo: Codable {
    let main: Main
    let weather: [Weather]
    
    struct Main: Codable {
        let temp: Double
        let feels_like: Double
    }
    
    // json애서 배열 안에 딕셔너리가 있는 경우
    struct Weather: Codable {
        let main: String
    }
}
