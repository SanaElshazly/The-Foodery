//
//  NetworkError.swift
//  TheFoodery
//
//  Created by Sana Elshazly on 6/7/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import Foundation

enum NetworkError : LocalizedError {
    case failedLoading
    case decodingFailed
    case failed
    
    var errorDescription: String? {
        switch self {
        case .failedLoading: return "Error Found : Failed to load data."
        case .decodingFailed: return "Error Found : Unable to Decode the data."
        case .failed : return "Error Found : Network Request failed"
            
        }
    }
}
