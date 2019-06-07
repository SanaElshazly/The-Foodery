//
//  GroceryData.swift
//  TheFoodery
//
//  Created by Sana Elshazly on 6/7/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import Foundation


// MARK: - GroceryData
struct GroceryData: Codable {
    let products: [Product]
}

// MARK: - Product
struct Product: Codable {
    let product_id, name: String
    let price: Int
    let image: String
}
