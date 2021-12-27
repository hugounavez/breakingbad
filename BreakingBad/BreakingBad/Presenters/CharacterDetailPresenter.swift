//
//  CharacterDetailPresenter.swift
//  BreakingBad
//
//  Created by Hugo Reyes on 12/19/21.
//

import SwiftUI
import Combine

class CharacterDetailPresenter : ObservableObject, SingleModelObjectTransferProtocol {
    
    var interactor : CharacterDetailInteractor
    @Published var model : BreakingBadCharacter
    
    init(interactor: CharacterDetailInteractor){
        self.interactor = interactor
        self.model = self.interactor.model
        self.interactor.delegate = self
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
