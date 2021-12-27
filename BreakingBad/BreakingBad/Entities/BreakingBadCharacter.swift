//
//  Character.swift
//  BreakingBad
//
//  Created by Hugo Reyes on 12/16/21.
//

import Foundation

struct BreakingBadCharacter : Codable, Identifiable{
    var name : String
    var id : Int
    var birthday : String
    var img : String
    var status: String
    var nickname : String
    var portrayed : String
    var category : String
    var occupation : [String]
    var appearance : [Int]
    
    var seasons : String {
        get {
            var temp : [String] = []
            self.appearance.forEach { element in
                temp.append("\(element)")
            }
            return temp.joined(separator: ",")
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case id = "char_id"
        case birthday
        case img
        case status
        case nickname
        case portrayed
        case category
        case occupation
        case appearance
    }
}
