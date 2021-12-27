//
//  CharacterCardViewInteractor.swift
//  BreakingBad
//
//  Created by Hugo Reyes on 12/17/21.
//

import Foundation

protocol CharacterCardViewInteractorProtocol {
    func getData()
}

class CharacterCardViewInteractor : CharacterCardViewInteractorProtocol {
    var model : BreakingBadCharacter
    weak var delegate : SingleModelObjectTransferProtocol?
    
    init(model: BreakingBadCharacter){
        self.model = model
    }
    
    func getData() {
        self.delegate?.modelHasChanged(data: self.model)
    }
    
}
