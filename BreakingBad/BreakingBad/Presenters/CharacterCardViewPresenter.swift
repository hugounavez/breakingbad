//
//  CharacterCardViewPresenter.swift
//  BreakingBad
//
//  Created by Hugo Reyes on 12/17/21.
//

import SwiftUI
import Combine

class CharacterCardViewPresenter: ObservableObject {
    @Published var model : BreakingBadCharacter
    
    private let interactor: CharacterCardViewInteractor
    
    init(interactor: CharacterCardViewInteractor){
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
