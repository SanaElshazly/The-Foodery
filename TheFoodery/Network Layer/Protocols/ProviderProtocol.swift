//
//  ProviderProtocol.swift
//  TheFoodery
//
//  Created by Sana Elshazly on 6/7/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import Foundation

protocol ProviderProtocol {
    
    func request<T>(type: T.Type, service: EndPointProtocol, completion: @escaping (Result<T,NetworkError>) -> ()) where T: Decodable
}
