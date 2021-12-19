//
//  CharacterListPresenter.swift
//  BreakingBad
//
//  Created by Hugo Reyes on 12/19/21.
//

import Foundation

class CharacterListPresenter : ObservableObject{
    private var interactor : CharacterListInteractor
    
    @Published var model : [BreakingBadCharacter]
    
    init(interactor: CharacterListInteractor){
        self.interactor = interactor
        self.model = self.interactor.model
    }
    
    
    func getCharacterList(){
        self.interactor.getCharacterList { rawResult in
            guard let result = rawResult else {return}
            self.model = result
            
        }
    }

}
