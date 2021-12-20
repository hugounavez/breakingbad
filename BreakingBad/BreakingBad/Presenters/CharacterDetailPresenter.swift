//
//  CharacterDetailPresenter.swift
//  BreakingBad
//
//  Created by Hugo Reyes on 12/19/21.
//

import SwiftUI

class CharacterDetailPresenter : ObservableObject {
    @Published var model : BreakingBadCharacter
    
    var interactor : CharacterDetailInteractor
    
    init(interactor: CharacterDetailInteractor){
        self.interactor = interactor
        self.model = self.interactor.model
    }
}
