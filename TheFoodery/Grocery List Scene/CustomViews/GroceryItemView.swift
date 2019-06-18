//
//  GroceryItemView.swift
//  TheFoodery
//
//  Created by Sana Elshazly on 6/15/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import UIKit
import Reusable
import SDWebImage

class GroceryItemView: UIView, NibOwnerLoadable {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadNibContent()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        loadNibContent()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        loadNibContent()
    }
    
    func configure(with product: Product?)  {
        guard product != nil else {
            return
        }
        
        nameLabel.text = product?.name
        let price = Double(product?.price ?? 0)
        priceLabel.text = String(format: "€%.02f", price/100)
        descriptionLabel.text = product?.description
        productImageView.sd_setImage(with: URL(string: product?.image ?? "placeholder.png"))
    }
    
    

}
