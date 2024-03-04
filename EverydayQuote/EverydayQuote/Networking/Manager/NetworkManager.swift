//
//  NetworkManager.swift
//  EverydayQuote
//
//  Created by Maryna Bolotska on 04/03/24.
//

import UIKit
import Alamofire


class NetworkManager {
    static let shared = NetworkManager()
    
    private init() { }
    
    typealias completionHandler = (Result<[Quote], Error>) -> Void
    

    func request(_ url: String, method: HTTPMethod, parameters: Parameters? = nil, headers: HTTPHeaders? = nil, completion: @escaping completionHandler) {
        let headers: HTTPHeaders = [
            "X-Api-Key": Constants.apiKey
        ]
        AF.request(Constants.baseURL, method: .get, parameters: parameters, headers: headers)
            .validate()
            .responseDecodable(of: [Quote].self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    func fetchQuote(apiKey: String, completionHandler: @escaping completionHandler) {
          let headers: HTTPHeaders = [
              "X-Api-Key": Constants.apiKey
          ]
          
          AF.request(Constants.baseURL, method: .get, parameters: nil, headers: headers).validate().responseDecodable(of: [Quote].self) { response in
              switch response.result {
              case .success(let quotes):
                  completionHandler(.success(quotes))
              case .failure(let error):
                  completionHandler(.failure(error))
              }
          }
      }
    
}
