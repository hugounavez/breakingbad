//
//  CharacterListInteractor.swift
//  BreakingBad
//
//  Created by Hugo Reyes on 12/19/21.
//

import Foundation

protocol CharacterListUseCase : AnyObject {
    func getCharacterList(completion: @escaping ([BreakingBadCharacter]?) -> ())
}


class CharacterListInteractor : CharacterListUseCase {
    var model: [BreakingBadCharacter]
    
    init(model: [BreakingBadCharacter] = []){
        self.model = model
    }
    
    func getCharacterList(completion: @escaping ([BreakingBadCharacter]?) -> ()){
        ServiceLayer.request(router: .getCharacters) { (result: Result<[BreakingBadCharacter], Error>) in
            switch result {
              case .success(let data):
                completion(data)
              case .failure:
                completion(nil)
              }
        }
    }
}
