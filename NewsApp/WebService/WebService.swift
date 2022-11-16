//
//  WebService.swift
//  NewsApp
//
//  Created by Hüseyin HÖBEK on 10.11.2022.
//

import Foundation
import Alamofire


protocol NewsWebServiceProtocol {
    func fetch<T: Codable>(response: T.Type, with path: NewsAPICall, completion: @escaping (Result<T, Error>) -> Void)
}

final class NewsWebService: NewsWebServiceProtocol {
    func fetch<T: Codable>(response: T.Type, with path: NewsAPICall, completion: @escaping (Result<T, Error>) -> Void) {
        let urlRequest = URLRequest(url: path.url)
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            if let error = error {
                completion(.failure(error))
                print("linkden veri gelmedi")
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.dataNotFound))
                return
    }
    
   // func fetch(with path: NewsAPICall, completion: @escaping (Result<Welcome, Error>) -> Void) {
      
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(T.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
}

protocol MainWebServiceAdapterProtocol {
    func getNews(completion: @escaping (Result<Welcome, Error>) -> Void)
}
final class MainWebServiceAdapter: MainWebServiceAdapterProtocol {
    private let webService: NewsWebServiceProtocol
    
    init(webService: NewsWebServiceProtocol) {
        self.webService = webService
    }
    
    func getNews(completion: @escaping (Result<Welcome, Error>) -> Void) {
        webService.fetch(response: Welcome.self, with: .getNews, completion: completion)
        
    }
        
}




enum NetworkError: Error {
    case dataNotFound
}




