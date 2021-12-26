//
//  CharacterListInteractor.swift
//  BreakingBad
//
//  Created by Hugo Reyes on 12/19/21.
//

import Foundation

protocol CharacterListInteractorDelegate : AnyObject {
    func modelHasChanged(data : [BreakingBadCharacter])
}

protocol CharacterListUseCase : AnyObject {
    func getCharacterList()
    
    func filterByNameAndSeason(searchText: String, season : Season)
    
    func filterBySeason(season: Season)
        
}


class CharacterListInteractor : CharacterListUseCase {
    func filterBySeason(season: Season) {
        switch season {
        case .all:
            self.delegate?.modelHasChanged(data: self.model)
        case .one:
            self.delegate?.modelHasChanged(data: self.model.filter({$0.appearance.contains(1)}))
        case .two:
            self.delegate?.modelHasChanged(data: self.model.filter({$0.appearance.contains(2)}))
        case .three:
            self.delegate?.modelHasChanged(data: self.model.filter({$0.appearance.contains(3)}))
        case .four:
            self.delegate?.modelHasChanged(data: self.model.filter({$0.appearance.contains(4)}))
        default:
            self.delegate?.modelHasChanged(data: self.model.filter({$0.appearance.contains(5)}))
            break
        }
    }
    
    
    weak var delegate : CharacterListInteractorDelegate?
    
    func filterByNameAndSeason(searchText: String, season: Season) {
        switch season {
        case .all:
            self.delegate?.modelHasChanged(data: self.model.filter({$0.name.contains(searchText)}))
        case .one:
            self.delegate?.modelHasChanged(data: self.model.filter({$0.name.contains(searchText) && $0.appearance.contains(1)}))
        case .two:
            self.delegate?.modelHasChanged(data: self.model.filter({$0.name.contains(searchText) && $0.appearance.contains(2)}))
        case .three:
            self.delegate?.modelHasChanged(data: self.model.filter({$0.name.contains(searchText) && $0.appearance.contains(3)}))
        case .four:
            self.delegate?.modelHasChanged(data: self.model.filter({$0.name.contains(searchText) && $0.appearance.contains(4)}))
        default:
            self.delegate?.modelHasChanged(data: self.model.filter({$0.name.contains(searchText) && $0.appearance.contains(5)}))
            break
        }
    }
    
    var model: [BreakingBadCharacter] = [] {
        didSet{
            // Notify presenter
            self.delegate?.modelHasChanged(data: self.model)
        }
    }
    
    init(model: [BreakingBadCharacter] = []){
        self.model = []
    }
    
    func getCharacterList(){
        ServiceLayer.request(router: .getCharacters) { (result: Result<[BreakingBadCharacter], Error>) in
            switch result {
              case .success(let data):
                self.model = data
              case .failure:
                print("Error requesting data")
              }
        }
    }
    
}
