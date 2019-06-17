//
//  GroceryItemDetailsPresenter.swift
//  TheFoodery
//
//  Created by Sana Elshazly on 6/16/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import Foundation

protocol DetailedGroceryPresentable {
    func fetchGroceryItemDetails(_ productID: String)
}

class GroceryItemDetailsPresenter : DetailedGroceryPresentable {
    
    private var fetchGroceryItemDetailsUsecase: FetchGroceryItemDetailsUsecase
    fileprivate weak var view: GroceryItemDetailsViewProtocol?
        
    //MARK -: Intialization
    
    init(view: GroceryItemDetailsViewProtocol,
         fetchGroceryItemDetailsUsecase: FetchGroceryItemDetailsUsecase) {
        self.view = view
        self.fetchGroceryItemDetailsUsecase = fetchGroceryItemDetailsUsecase
    }
    
    func fetchGroceryItemDetails(_ productID: String) {
        self.view?.showLoading()
        
        fetchGroceryItemDetailsUsecase.setProductID(productID)
        fetchGroceryItemDetailsUsecase.fetchGroceryItemDetails { (response) in
            switch response {
            case let .success(groceryItemDetails):
                print(groceryItemDetails)
                
                DispatchQueue.main.async {
                    self.view?.updateProduct(with: groceryItemDetails)
                    self.view?.hideLoading()
                }
                
            case let .failure(error):
                print(error)
                // TODO: handle error here
                self.view?.hideLoading()
            }
        }
    }
    
}
