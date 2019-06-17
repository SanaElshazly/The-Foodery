//
//  GroceriesListViewRouter.swift
//  TheFoodery
//
//  Created by Sana Elshazly on 6/16/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import UIKit

protocol Navigator {
    associatedtype Destination
    func navigate(to destination: Destination)
}

enum Destination {
    case showDetailedGroceryItem
}

class GroceriesListViewRouter: Navigator {
    
    private weak var viewController: GroceriesListViewController?
    private var selectedProductID = String()
    
    init(viewController: GroceriesListViewController) {
        self.viewController = viewController
    }
    
    func navigate(to destination: Destination) {
        guard let detailedGIFViewController =  makeViewController(for: destination) else {
            
            return
        }
        self.viewController?.navigationController?.pushViewController(detailedGIFViewController, animated: false)
    }
    
    func configureDetailedGroceryItem(_ selectedProductID: String) {
        self.selectedProductID = selectedProductID
    }
    
    private func makeViewController(for destination: Destination) -> UIViewController? {
        switch destination {
            
        case .showDetailedGroceryItem:
            return initiateGroceryItemDetailsViewController() ?? nil
        }
    }
    
    func initiateGroceryItemDetailsViewController() -> UIViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let groceryItemDetailsViewController  = storyboard.instantiateViewController(withIdentifier: "GroceryItemDetailsViewController") as? GroceryItemDetailsViewController {
            
            groceryItemDetailsViewController.selectedProductID = selectedProductID
            
            return groceryItemDetailsViewController
        }
        
        return nil
    }
}
