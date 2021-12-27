//
//  CharacterCardViewPresenter.swift
//  BreakingBad
//
//  Created by Hugo Reyes on 12/17/21.
//

import SwiftUI
import Combine

class CharacterCardViewPresenter: ObservableObject, SingleModelObjectTransferProtocol {
    private let interactor: CharacterCardViewInteractor
    @Published var model : BreakingBadCharacter
    
    init(interactor: CharacterCardViewInteractor){
        self.interactor = interactor
        self.model = self.interactor.model
    }
    
    func modelHasChanged(data: BreakingBadCharacter) {
        self.model = data
    }
    
    func updateModel(){
        // This is a symbolic update method, in case
        // it is needed in the future
        self.interactor.getData()
    }
    
}
