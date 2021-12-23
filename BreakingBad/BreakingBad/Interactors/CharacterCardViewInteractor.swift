//
//  CharacterCardViewInteractor.swift
//  BreakingBad
//
//  Created by Hugo Reyes on 12/17/21.
//

import Foundation

class CharacterCardViewInteractor {
    var model : BreakingBadCharacter
    
    init(model: BreakingBadCharacter){
        self.model = model
    }
    
    func requestData(completion: @escaping (_ result: BreakingBadCharacter)->()) {
            // Here will go for example the api request
            completion(model)
    }
}
