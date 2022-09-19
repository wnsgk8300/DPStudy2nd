//
//  AsyncAwaitNetworkService.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/09/19.
//

import UIKit

class AsyncAwaitNetworkService {
    
    static let shared = AsyncAwaitNetworkService()
    private init() {}
    
    let url = URL(string: "https://api.quotable.io/random")!
    
    //    func getQuotes(completion: @escaping (String) -> Void) -> String {
    //        var result = ""
    //        URLSession.shared.dataTask(with: url) { data, response, error in
    //            if let error = error {
    //                print(error)
    //                return
    //            }
    //
    //            if let response = response as? HTTPURLResponse,
    //               !(200..<300).contains(response.statusCode) {
    //                return
    //            }
    //            guard let data = data else { return }
    //
    //            do {
    //                let quotes = try JSONDecoder().decode(Quotes.self, from: data)
    //                print(quotes)
    //                result = quotes.content
    //                completion(result)
    //            } catch {
    //                print(error)
    //            }
    //        }.resume()
    //        return result
    //    }
    
    // error처리 추가
    func getQuotes(completion: @escaping (Result<String, AsyncAwaitNetworkError>) -> Void) -> String {
        var result = "Test"
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                completion(.failure(.communicationError))
                return
            }
            
            if let response = response as? HTTPURLResponse,
               !(200..<300).contains(response.statusCode) {
                completion(.failure(.badResponse))
                return
            }
            guard let data = data else { return }
            completion(.failure(.noData))
            do {
                let quotes = try JSONDecoder().decode(Quotes.self, from: data)
                print(quotes)
                result = quotes.content
                completion(.success(result))
            } catch {
                print(error)
                completion(.failure(.decodeFailed))
            }
        }.resume()
        return result
    }
    
    //위처럼 String대신 Result<String, AsyncAwaitNetworkError>식으로 전달해도 됨
    func getQuotes() async -> String {
        do {
            //내부가 위의 async안에 잡혀있으므로 Tast사용 안해도 됨
            let (data, response) = try await URLSession.shared.data(from: url)
            if let response = response as? HTTPURLResponse,
               !(200..<300).contains(response.statusCode) {
                return "응답 에러"
            }
            let quote = try JSONDecoder().decode(Quotes.self, from: data)
            return quote.content
        } catch {
            return "Decode Error"
        }
    }
    
    
    func getQuotes2() async -> [String] {
        var quotes = [String]()
        for _ in 1...3 {
            quotes.append(await getQuotes())
        }
        return quotes
    }
    
    func getQuotes3() async -> [String] {
        async let firstQuote = getQuotes()
        async let secondQuote = getQuotes()
        async let thirdQuote = getQuotes()
        //위 세개의 순서가 보장되지 않음, 대신 빠를 수 있음
        //이건 데이터가 작아서 순서대로 나오네
        return await ["1: ", firstQuote, "2: ", secondQuote, "3: ", thirdQuote]
    }
    
    func getQuotes4() async -> [String] {
        let firstQuote = await getQuotes() //1
        let secondQuote = await getQuotes() //2
        let thirdQuote = await getQuotes() //3
        // 위 3개의 순서가 보장됨, 대신 오래걸릴 수 있음
        return ["1: ", firstQuote, "2: ", secondQuote, "3: ", thirdQuote]
    }
    
    // 엥간하면 CheckedContinuation사용하기
    // 기존 함수를 건드리지 않고, async로 사용함
    // 기존에 throw있으면 resume throwing하면 됨
    func continuationGetQuote() async -> String {
        return await withCheckedContinuation { continuation in
            getQuotes { result in
                switch result {
                case .success(let quote):
                    // resume returning은 한번만 나와야 함
                    continuation.resume(returning: quote)
                case .failure(let error):
//                    continuation.resume(returning: error.localizedDescription)
                    print(error)
                }
            }
        }
    }
}
