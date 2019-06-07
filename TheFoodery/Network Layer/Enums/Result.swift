//
//  Result.swift
//  TheFoodery
//
//  Created by Sana Elshazly on 6/7/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import Foundation

enum Result<T, E: Swift.Error> {
    case success(T)
    case failure(E)
}
