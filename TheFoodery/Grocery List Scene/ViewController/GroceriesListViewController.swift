//
//  GroceriesListViewController.swift
//  TheFoodery
//
//  Created by Sana Elshazly on 6/8/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import UIKit

protocol GroceriesListViewProtocol: class {
    func showLoading()
    func hideLoading()
    func updateProducts(with list: [Product])
}

class GroceriesListViewController: UIViewController {

    //MARK- Outlets
    @IBOutlet weak var groceriesCollectionView: UICollectionView!
    
    //MARK- Properties
    let configurator = GroceriesListViewConfigurator()
    var presenter: GroceriesListPresentable?
    var productsList : [Product] = [] {
        didSet{
            DispatchQueue.main.async {
                self.groceriesCollectionView?.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureGroceriesCollectionView()
        configurator.configure(viewController: self)
        presenter?.fetchGroceriesList()
    }
    
    private func configureGroceriesCollectionView() {
        groceriesCollectionView.dataSource = self
        groceriesCollectionView.delegate = self
        
        groceriesCollectionView?.backgroundColor = UIColor.clear
        groceriesCollectionView.register(cellType: GroceryItemCollectionViewCell.self)
    }
    
    func updateProducts(with list: [Product]) {
        productsList = list
    }

}

extension GroceriesListViewController:  UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(for: indexPath) as GroceryItemCollectionViewCell
        
        // TODO: Configure cell here
        cell.configureCell(with: productsList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO: navigate to product details here
    }
}

// MARK: - Handle CollectionView Layout

extension GroceriesListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  10
        let collectionViewSize = collectionView.frame.size.width - padding
        
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }
}


// MARK: - Handle Loading Indicator

extension GroceriesListViewController: GroceriesListViewProtocol {
    func showLoading() {
        // TODO: show loading indicator here
    }
    
    func hideLoading() {
        // TODO: hide loading indicator here
    }
}
