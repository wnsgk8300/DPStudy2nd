//
//  NetworkService.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/08/31.
//

import Foundation
class NetworkService {
    
    static let shared = NetworkService()
    private init() {}
    
    //    func fetch() {
    //        let URL = URL(string: urlString)!
    //        let dataTask = URLSession.shared.dataTask(with: URL) { data, response, error in
    //            guard error == nil else { fatalError() }
    //            guard let response = response as? HTTPURLResponse else { fatalError() }
    //            if !(200..<400).contains(response.statusCode) {
    //                fatalError()
    //            } else {
    //                guard let data = data else { return }
    //                do {
    //                    let decodedData = try JSONDecoder().decode(WeatherInfo.self, from: data)
    //                    print(decodedData.main.temp)
    //                } catch {
    //                   fatalError()
    //                }
    //            }
    //        }
    //        dataTask.resume()
    //    }
    
    // 코드 최적화
    func fetch(urlString: String, completion: @escaping (WeatherInfo) -> Void) {
        // Background Thread
        let URL = URL(string: urlString)!
        URLSession.shared.dataTask(with: URL) { data, response, error in
            guard error == nil else { fatalError() }
            guard let response = response as? HTTPURLResponse,
                  (200..<400).contains(response.statusCode) else { fatalError() }
            guard let data = data else { return }
            do {
                let decodedData = try JSONDecoder().decode(WeatherInfo.self, from: data)
                print(decodedData)
                // UI는 Main Thread에서!
                DispatchQueue.main.async {
                    completion(decodedData)
                    print(Thread.isMainThread)
//                    self.tempLabel.text = String(decodedData.main.temp)
                }
                print(decodedData.main.temp)
            } catch {
                fatalError()
            }
        }.resume()
    }
}
