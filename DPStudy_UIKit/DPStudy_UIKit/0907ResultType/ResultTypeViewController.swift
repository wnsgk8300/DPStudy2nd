////
////  ResultTypeViewController.swift
////  DPStudy_UIKit
////
////  Created by JEON JUNHA on 2022/09/07.
////
//
//import UIKit
//
//class ResultTypeViewController: UIViewController {
//    
//    
//    override func viewDidLoad() {
//        setUI()
//        getQuote { result in
//            switch result {
//            case .success(let quote):
//                print(quote)
//            case .failure(let error):
//                switch error {
//                case .noData:
//                    print(error.localizedDescription)
//                case .badResponse:
//                    print(error.localizedDescription) // "response가 이상해요"
//                case .badUrl:
//                    print(error.localizedDescription)
//                case .communicationError:
//                    print(error.localizedDescription)
//                case .decodeFailed:
//                    // 직접 작성해서 에러를 잘 파악해야함
//                    print(error.localizedDescription)
//                }
//            }
//        }
//        
//        throwingGetQuote { result in
//            switch result {
//            case .success(let data):
//                do {
//                    let quote = try self.decodeData(data: data)
//                } catch {
//                    print("Decode Error")
//                    print(error)
//                }
//            case .failure(let error):
//                print("Network Error")
//                print(error)
//            }
//        }
//    }
//}
//
//extension ResultTypeViewController {
//                                            // 자동으로 .success, .failure 가 생김
//    private func getQuote(completion: @escaping (Result<Quote, NetworkError>) -> Void) {
//        let url = URL(string: "https://api.quotable.io/random")
//        URLSession.shared.dataTask(with: url!) { data, response, error in
//            guard error == nil else {
//                completion(.failure(.communicationError))
//                return
//            }
//            guard let response = response as? HTTPURLResponse,
//            (200..<300).contains(response.statusCode) else {
//                completion(.failure(.badResponse))
//                return
//            }
//            guard let data = data else {
//                completion(.failure(.noData))
//                return
//            }
//            do {
//                let quote = try JSONDecoder().decode(Quote.self, from: data)
//                completion(.success(quote))
//            } catch {
//                print(error)
//            }
//        }.resume()
//    }
//    
//    private func throwingGetQuote(completion: @escaping (Result<Data, NetworkError>) -> Void) throws {
//        let url = URL(string: "https://api.quotable.io/random")
//        URLSession.shared.dataTask(with: url!) { data, response, error in
//            guard error == nil else {
//                completion(.failure(.communicationError))
//                return
//            }
//            guard let response = response as? HTTPURLResponse,
//            (200..<300).contains(response.statusCode) else {
//                completion(.failure(.badResponse))
//                return
//            }
//            guard let data = data else {
//                completion(.failure(.noData))
//                return
//            }
//                completion(.success(data))
//        }.resume()
//    }
//    
//    private func decodeData(data: Data) throws -> Quote {
//        return try JSONDecoder().decode(Quote.self, from: data)
//    }
//}
//
//// MARK: - UI
//extension ResultTypeViewController {
//    final private func setUI() {
//        setBasics()
//        setLayout()
//    }
//    final private func setBasics() {
//        
//    }
//    final private func setLayout() {
//        
//    }
//}
