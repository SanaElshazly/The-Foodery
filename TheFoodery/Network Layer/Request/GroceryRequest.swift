//
//  GroceryRequest.swift
//  TheFoodery
//
//  Created by Sana Elshazly on 6/7/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import Foundation

enum GroceryRequest: EndPointProtocol {
    
    case groceries
    case productDetail(product_id: String)
    
    
    var baseURL: URL {
        return URL(string: "https://s3-eu-west-1.amazonaws.com/developer-application-test/cart/")!
    }
    
    var path: String {
        switch self {
        case .groceries:
            return "list"
        case let .productDetail(product_id):
            return "\(product_id)\\detail"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var headers: Headers? {
        return nil
    }
    
    var parameters: Parameters?{
        switch self {
        case .groceries:
            return nil

        case .productDetail:
            return nil
        }
    }
    
}
