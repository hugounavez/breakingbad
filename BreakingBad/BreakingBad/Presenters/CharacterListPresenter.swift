//
//  CharacterListPresenter.swift
//  BreakingBad
//
//  Created by Hugo Reyes on 12/19/21.
//

import SwiftUI

protocol CharacterListPresenterUseCase {
    func getCharacterList()
}


class CharacterListPresenter : ObservableObject, CharacterListPresenterUseCase, CharacterListInteractorDelegate{
    func modelHasChanged(data: [BreakingBadCharacter]) {
        self.model = data
    }
    
    private var interactor : CharacterListUseCase
    private let router = CharacterListViewRouter()
    
    @Published var model : [BreakingBadCharacter] = []
    
    init(interactor: CharacterListUseCase){
        self.interactor = interactor
    }
    
    
    func getCharacterList(){
        self.interactor.getCharacterList { rawResult in
            guard let result = rawResult else {return}
            self.model = result
            
        }
    }
    
    func linkBuilder<Content: View>(
        for trip: BreakingBadCharacter,
        @ViewBuilder content: () -> Content
      ) -> some View {
        NavigationLink(
          destination: router.makeDetailView(
            for: trip)) {
                
              content()
        }
    }

}
