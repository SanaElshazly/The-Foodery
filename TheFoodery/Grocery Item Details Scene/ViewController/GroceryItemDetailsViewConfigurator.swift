//
//  GroceryItemDetailsViewConfigurator.swift
//  TheFoodery
//
//  Created by Sana Elshazly on 6/17/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import Foundation

class GroceryItemDetailsViewConfigurator: NSObject {
    func configure(viewController: GroceryItemDetailsViewController) {
        let fetchGroceryItemDetailsUsecase = FetchGroceryItemDetailsUsecase()
        let presenter = GroceryItemDetailsPresenter(view: viewController, fetchGroceryItemDetailsUsecase: fetchGroceryItemDetailsUsecase)
        viewController.presenter = presenter
    }
}
