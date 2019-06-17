//
//  GroceriesListPresenter.swift
//  TheFoodery
//
//  Created by Sana Elshazly on 6/8/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import Foundation

protocol GroceriesListPresentable {
    func fetchGroceriesList()
    func navigateToGroceryItemDetailsViewController(_ selectedProductID: String) 
}

class GroceriesListPresenter : GroceriesListPresentable {
    
    private var fetchGroceriesListUsecase: FetchGroceriesListUsecase
    fileprivate weak var view: GroceriesListViewProtocol?
    private var router: GroceriesListViewRouter?
    var groceriesList = [Product]()
    
    //MARK -: Intialization
    
    init(view: GroceriesListViewProtocol,
         fetchGroceriesListUsecase: FetchGroceriesListUsecase,
         router: GroceriesListViewRouter) {
        self.view = view
        self.fetchGroceriesListUsecase = fetchGroceriesListUsecase
        self.router = router
    }
    
    func fetchGroceriesList() {
        self.view?.showLoading()
        fetchGroceriesListUsecase.fetchGroceries { (response) in
            
            switch response {
            case let .success(groceriesData):
                print(groceriesData)

        
                self.groceriesList = groceriesData.products
                DispatchQueue.main.async {
                    self.view?.updateProducts(with: self.groceriesList)
                    self.view?.hideLoading()
                }
                
            case let .failure(error):
                print(error)
                // TODO: handle error here
                self.view?.hideLoading()
            }
        }
    }
    
    // MARK:- Handle Navigation
    
    func navigateToGroceryItemDetailsViewController(_ selectedProductID: String) {
        router?.configureDetailedGroceryItem(selectedProductID)
        router?.navigate(to: .showDetailedGroceryItem)
    }

}
