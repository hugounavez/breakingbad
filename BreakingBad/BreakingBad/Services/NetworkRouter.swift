//
//  NetworkRouter.swift
//  BreakingBad
//
//  Created by Hugo Reyes on 12/16/21.
//


import Foundation

enum NetworkRouter {
    // 1.
    case getCharacters
    
    // 2.
    var scheme: String {
        switch self {
        case .getCharacters:
            return "https"
        }
    }
    
    // 3.
    var host: String {
        switch self {
        case .getCharacters:
            return "breakingbadapi.com"
            
        }
    }
    
    // 4.
    var path: String {
        switch self {
        case .getCharacters:
            return "/api/characters"
        }
    }
    
    // 5.
    var parameters: [URLQueryItem] {
        switch self {
        case .getCharacters:
            return []
        }
    }
    
    
    // 7.
    var method: String {
        switch self {
        case .getCharacters:
            return "GET"
        }
    }
}

