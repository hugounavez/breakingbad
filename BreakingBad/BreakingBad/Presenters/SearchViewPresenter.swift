//
//  SearchViewPresenter.swift
//  BreakingBad
//
//  Created by Hugo Reyes on 12/22/21.
//

import Foundation
import SwiftUI

class SearchViewPresenter : ObservableObject, CharacterListPresenterUseCase {
    private var interactor : CharacterListUseCase
    
    @Published var model : [BreakingBadCharacter]
    

    @Published var season : Season = .all
    
    var originalModel : [BreakingBadCharacter]
    @Published var searchText = "" {
        didSet {
            guard self.searchText != "" else {
                self.model = self.originalModel
                return
            }
            
            self.filterBy(text: self.searchText)
        }
    }
    
    func getCharacterList(){
        self.interactor.getCharacterList { rawResult in
            guard let result = rawResult else {return}
            self.originalModel = result
            self.model = self.originalModel

        }
    }
    
    init(interactor: CharacterListUseCase){
        self.originalModel = []
        self.model = []
        self.interactor = interactor
    }
    
    func filterBy(text: String){
        
        switch self.season {
        case .all:
            self.model = self.originalModel.filter({$0.name.contains(text)})
        case .one:
            self.model = self.originalModel.filter({$0.name.contains(text) && $0.appearance.contains(1)})
        case .two:
            self.model = self.originalModel.filter({$0.name.contains(text) && $0.appearance.contains(2)})
        case .three:
            self.model = self.originalModel.filter({$0.name.contains(text) && $0.appearance.contains(3)})
        case .four:
            self.model = self.originalModel.filter({$0.name.contains(text) && $0.appearance.contains(4)})
        default:
            self.model = self.originalModel.filter({$0.name.contains(text) && $0.appearance.contains(5)})
            break
        }
        
    }
    

    
}
