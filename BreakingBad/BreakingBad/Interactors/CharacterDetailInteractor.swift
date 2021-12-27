//
//  CharacterDetailInteractor.swift
//  BreakingBad
//
//  Created by Hugo Reyes on 12/19/21.
//

import Foundation
import Combine


protocol CharacterDetailInteractorProtocol {
    func getData()
}

class CharacterDetailInteractor: CharacterDetailInteractorProtocol {
    var model : BreakingBadCharacter
    weak var delegate : SingleModelObjectTransferProtocol?
    
    init(model: BreakingBadCharacter){
        self.model = model
    }
    
    func getData() {
        self.delegate?.modelHasChanged(data: self.model)
    }
    
}
