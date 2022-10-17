//
//  CombineAPIService.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/10/17.
//

import Foundation

struct CombineAPIService {
    func getQuote() async throws -> CombineQuote {
        let (data, response) = try await URLSession.shared.data(from: URL.combineQuote)
        return try JSONDecoder().decode(CombineQuote.self, from: data)
    }
    func getCombineQuote(completion: @escaping (Result<CombineQuote, CombineNetworkError>) -> Void) {
        URLSession.shared.dataTask(with: URL.combineQuote, completionHandler: { data, response , error in
            if let error = error {
                completion(.failure(.communicationError))
                return
            }
            if let response = response as? HTTPURLResponse,
               !(200..<300).contains(response.statusCode) {
                completion(.failure(.badResponse))
                return
            }
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            do {
                let quote = try JSONDecoder().decode(CombineQuote.self, from: data)
                                    completion(.success(quote))
//                DispatchQueue.main.async {
//                }
            } catch {
                completion(.failure(.decodedFailed))
            }
        }).resume()
    }
}
