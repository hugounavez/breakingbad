//
//  CharacterListInteractor.swift
//  BreakingBad
//
//  Created by Hugo Reyes on 12/19/21.
//

import Foundation

class CharacterListInteractor {
    var model: [BreakingBadCharacter]
    
    init(model: [BreakingBadCharacter] = []){
        self.model = model
    }
    
    func getCharacterList(completion: @escaping ([BreakingBadCharacter]?) -> ()){
        
        ServiceLayer.request(router: .getCharacters) { (result: Result<[BreakingBadCharacter], Error>) in
            switch result {
              case .success(let data):
                  print("success")
                self.model = data
                completion(data)
              case .failure:
                    print("failure")
                completion(nil)
              }
        }
    }
    
}
