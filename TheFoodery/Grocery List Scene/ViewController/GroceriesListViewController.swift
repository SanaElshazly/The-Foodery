//
//  GroceriesListViewController.swift
//  TheFoodery
//
//  Created by Sana Elshazly on 6/8/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import UIKit

class GroceriesListViewController: UIViewController {

    //MARK- Outlets
    @IBOutlet weak var groceriesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    private func configureTrendingGIFsCollectionView() {
        groceriesCollectionView.dataSource = self
        groceriesCollectionView.delegate = self
        
        groceriesCollectionView?.backgroundColor = UIColor.clear
        groceriesCollectionView.register(cellType: GroceryItemCollectionViewCell.self)
    }

}

extension GroceriesListViewController:  UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(for: indexPath) as GroceryItemCollectionViewCell
        
        // TODO: Configure cell here
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO: navigate to product details here
    }
}
