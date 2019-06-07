//
//  GroceriesListRemoteDataStore.swift
//  TheFoodery
//
//  Created by Sana Elshazly on 6/7/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import Foundation

protocol GroceriesListDataStoreProtocol {
    func fetchGroceries(completion: @escaping (Result<GroceryData, NetworkError>) -> ())
    
}

class GroceriesListRemoteDataStore: GroceriesListDataStoreProtocol {
    private let sessionProvider = URLSessionHandler()
    
    func fetchGroceries(completion: @escaping (Result<GroceryData, NetworkError>) -> ()) {
        sessionProvider.request(type: GroceryData.self, service: GroceryRequest.groceries) { (response) in
            switch response {
            case let .success(groceries):
                print(groceries)
                completion(.success(groceries))
                
            case let .failure(error):
                completion(.failure(.failed))
                print(error)
            }
        }
        
    }
}
