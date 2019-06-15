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
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(with product: Product?)  {
        guard product != nil else {
            return
        }

        nameLabel.text = product?.name
        priceLabel.text = "\(product?.price ?? 0)"
        productImageView.sd_setImage(with: URL(string: product?.image ?? "placeholder.png"))
    }
    
}

