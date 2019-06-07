//
//  FetchGroceriesListUsecase.swift
//  TheFoodery
//
//  Created by Sana Elshazly on 6/7/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import Foundation

class FetchGroceriesListUsecase {
    
    var groceriesListDataStore : GroceriesListDataStoreProtocol?
    
    func fetchGroceries(completion: @escaping (Result<GroceryData, NetworkError>) -> ()) {
        
        groceriesListDataStore?.fetchGroceries(completion: { (response) in
            switch response {
            case let .success(groceries):
                print(groceries)
                completion(.success(groceries))
                
            case let .failure(error):
                print(error)
                completion(.failure(.failed))
            }
        })
    }
    
    
}
