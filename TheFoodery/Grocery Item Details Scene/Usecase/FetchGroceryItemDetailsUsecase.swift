//
//  FetchGroceryItemDetailsUsecase.swift
//  TheFoodery
//
//  Created by Sana Elshazly on 6/16/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import Foundation

class FetchGroceryItemDetailsUsecase {
    
    private let sessionProvider = URLSessionHandler()
    private var productID = ""
    
    func setProductID(_ productID: String) {
        self.productID = productID
    }
    
    func fetchGroceryItemDetails(completion: @escaping (Result<Product, NetworkError>) -> ()) {
        sessionProvider.request(type: Product.self, service: GroceryRequest.productDetail(product_id: productID)) { (response) in
            switch response {
            case let .success(product):
                print(product)
                completion(.success(product))

            case let .failure(error):
                completion(.failure(.failed))
                print(error)
            }
        }
        
    }
    
}
