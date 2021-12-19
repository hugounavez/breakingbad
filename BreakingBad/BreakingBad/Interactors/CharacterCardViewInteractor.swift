//
//  CharacterCardViewInteractor.swift
//  BreakingBad
//
//  Created by Hugo Reyes on 12/17/21.
//

import Foundation

class CharacterCardViewInteractor{
    var model : BreakingBadCharacter
    
    init(model: BreakingBadCharacter){
        self.model = model
    }
    
    func getCharacters(completion: @escaping ([BreakingBadCharacter]?) -> ()){
        
        ServiceLayer.request(router: .getCharacters) { (result: Result<[BreakingBadCharacter], Error>) in
            switch result {
              case .success(let data):
                  print("success")
                completion(data)
              case .failure:
                    print("failure")
                completion(nil)
              }
        }

        
    }
}
