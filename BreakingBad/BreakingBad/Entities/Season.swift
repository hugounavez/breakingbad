//
//  Season.swift
//  BreakingBad
//
//  Created by Hugo Reyes on 12/26/21.
//

import Foundation

enum Season: String, CaseIterable, Identifiable {
    case all
    case one
    case two
    case three
    case four
    case five
    
    var id: String { self.rawValue}
}
