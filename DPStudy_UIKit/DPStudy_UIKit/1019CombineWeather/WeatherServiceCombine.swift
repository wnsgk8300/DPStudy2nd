//
//  WeatherServiceCombine.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/10/19.
//

import Combine
import Foundation

struct WeatherServiceCombine {
    
    func getWeather(city: String) -> AnyPublisher<WeatherInfoCombine, Error> {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=ae54862e80cd4582519f9266c3359724")!

        return URLSession.shared.dataTaskPublisher(for: url)
            .map { publisher in
//                print(publisher.response)
                return publisher.data
            }
            .decode(type: WeatherInfoCombine.self, decoder: JSONDecoder())
        // main만 구독하는 경우임, 없어지면 WeatherInfoCombine전체 구독
//            .map { weatherInfoCombine in
//                return weatherInfoCombine.main
//            }
        // 이걸 구독하는 애가 main에서 작업하도록
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

