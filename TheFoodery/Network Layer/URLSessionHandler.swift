//
//  URLSessionHandler.swift
//  TheFoodery
//
//  Created by Sana Elshazly on 6/7/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import Foundation

final class URLSessionHandler: ProviderProtocol {
    
    private var session: URLSessionProtocol
    fileprivate var task: URLSessionTask?
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func request<T>(type: T.Type, service: EndPointProtocol, completion: @escaping (Result<T,NetworkError>) -> ()) where T: Decodable {
        
        let request = URLRequest(service: service)
        task = session.dataTask(request: request, completionHandler: { [weak self] data, response, error in
            let httpResponse = response as? HTTPURLResponse
            self?.handleDataResponse(data: data, response: httpResponse, error: error, completion: completion)
        })
        
        task?.resume()
    }
    
    private func handleDataResponse<T: Decodable>(data: Data?, response: HTTPURLResponse?, error: Error?, completion: (Result<T,NetworkError>) -> ()) {
        guard error == nil else { return completion(.failure(.failed)) }
        guard let response = response else { return completion(.failure(.failedLoading)) }
        
        switch response.statusCode {
        case 200...299:
            guard let data = data, let model = try? JSONDecoder().decode(T.self, from: data) else { return
                completion(.failure(.decodingFailed)) }
            completion(.success(model))
        default:
            completion(.failure(.failed))
        }
    }
    
}
