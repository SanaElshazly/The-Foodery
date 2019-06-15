//
//  GroceryItemCollectionViewCell.swift
//  TheFoodery
//
//  Created by Sana Elshazly on 6/7/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import UIKit
import Reusable
import SDWebImage

class GroceryItemCollectionViewCell: UICollectionViewCell, NibReusable {
    
    @IBOutlet weak var groceryItemView: GroceryItemView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(with product: Product?)  {
        guard product != nil else {
            return
        }
        
        groceryItemView.configure(with: product)
    }
    
}

