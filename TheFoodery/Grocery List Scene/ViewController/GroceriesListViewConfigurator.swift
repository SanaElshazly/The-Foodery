//
//  GroceriesListViewConfigurator.swift
//  TheFoodery
//
//  Created by Sana Elshazly on 6/11/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import Foundation

class GroceriesListViewConfigurator: NSObject {
    func configure(viewController: GroceriesListViewController) {
        let fetchGroceriesListUsecase = FetchGroceriesListUsecase()
        let presenter = GroceriesListPresenter(view: viewController, fetchGroceriesListUsecase: fetchGroceriesListUsecase)
        viewController.presenter = presenter
    }
}
