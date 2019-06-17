//
//  GroceryItemDetailsViewController.swift
//  TheFoodery
//
//  Created by Sana Elshazly on 6/16/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import UIKit

protocol GroceryItemDetailsViewProtocol: class {
    func showLoading()
    func hideLoading()
    func updateProduct(with productdetails: Product)
}

class GroceryItemDetailsViewController: UIViewController {

    //MARK- Outlets
    @IBOutlet weak var groceryItemView: GroceryItemView!
    
    //MARK- Properties
    var presenter: DetailedGroceryPresentable?
    let configurator = GroceryItemDetailsViewConfigurator()
    var selectedProductID = String()
    var groceryItem : Product? {
        didSet{
            groceryItemView.configure(with: groceryItem)
        }
    }
    
    let alert = UIAlertController(title: nil, message: "Loading...", preferredStyle: .alert)
    let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        configurator.configure(viewController: self)
        configureLoadingIndicator()
        presenter?.fetchGroceryItemDetails(selectedProductID)
    }
    
    func configureLoadingIndicator(){
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
    }
    
    func updateProduct(with productdetails: Product) {
        self.groceryItem = productdetails
    }
}


// MARK: - Handle Loading Indicator

extension GroceryItemDetailsViewController: GroceryItemDetailsViewProtocol {
    func showLoading() {
        loadingIndicator.startAnimating();
        alert.view.addSubview(loadingIndicator)
        self.parent?.present(alert, animated: true, completion: nil)
    }
    
    func hideLoading() {
        self.parent?.dismiss(animated: false, completion: nil)
    }
}

