//
//  CharacterCardViewPresenter.swift
//  BreakingBad
//
//  Created by Hugo Reyes on 12/17/21.
//

import SwiftUI
import Combine

class CharacterCardViewPresenter: ObservableObject {
    private let interactor: CharacterCardViewInteractor

    @Published var model : BreakingBadCharacter

    init(interactor: CharacterCardViewInteractor){
        self.interactor = interactor
        
        self.model = self.interactor.model
    }
    
    func updateModel(model: BreakingBadCharacter){
        self.interactor.model = model
        self.model = self.interactor.model
    }
    
}
