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
    @Published var seasonsLabel : String =  ""
    
    var interactor : CharacterDetailInteractor

    init(interactor: CharacterDetailInteractor){
        self.interactor = interactor
        self.model = self.interactor.model
        self.setString()
    }
    
    func updateModel(){
        // This is a symbolic update method, in case
        // it is needed in the future
        self.interactor.requestData { result in
            self.model = result
            self.setString()
        }
    }
    
    func setString(){
        self.seasonsLabel = ""
        var temp : [String] = []
        self.model.appearance.forEach { element in
            temp.append("\(element)")
        }
        self.seasonsLabel = temp.joined(separator: ",")
    }
    
}
