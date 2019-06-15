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
    let product_id, name: String?
    let price: Int?
    let image: String?
    let description: String?
    
    init(product_id: String? = "product_id", name: String? = "Grocery Name", price: Int? = 0, image: String? = "placeholder" , description: String? = "Grocery Description") {
        self.product_id = product_id
        self.name = name
        self.price = price
        self.image = image
        self.description = description
    }
}
