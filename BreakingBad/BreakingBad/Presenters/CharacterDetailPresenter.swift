//
//  CharacterDetailPresenter.swift
//  BreakingBad
//
//  Created by Hugo Reyes on 12/19/21.
//

import SwiftUI
import Combine

class CharacterDetailPresenter : ObservableObject {
    @Published var model : BreakingBadCharacter
    
    var interactor : CharacterDetailInteractor

    init(interactor: CharacterDetailInteractor){
        self.interactor = interactor
        self.model = self.interactor.model
    }
    
    func updateModel(){
        // This is a symbolic update method, in case
        // it is needed in the future
        self.interactor.requestData { result in
            self.model = result
        }
    }
}
