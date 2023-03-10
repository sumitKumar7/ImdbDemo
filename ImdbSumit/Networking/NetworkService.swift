//
//  NetworkService.swift
//  ImdbSumit
//
//  Created by Sumit Kumar on 10/03/23.
//

import Foundation

enum HttpMethods: String {
    case GET
    case POST
    case DELETE
    case PUT
}

struct NetworkService {
    
    func fetchData<T: Decodable>(for url: String,
                                 httpMethod: String = HttpMethods.GET.rawValue,
                                 headers: [String: String] = [:],
                                 completionHandler: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: url) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.allHTTPHeaderFields = headers
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completionHandler(.failure(error))
            }
            if let data = data {
                do {
                    let object = try JSONDecoder().decode(T.self, from: data)
                    completionHandler(.success(object))
                } catch let decoderError {
                    completionHandler(.failure(decoderError))
                }
            }
        }.resume()
    }
}
