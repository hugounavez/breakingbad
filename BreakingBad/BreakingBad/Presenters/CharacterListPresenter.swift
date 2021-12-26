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
    
    public var interactor : CharacterListInteractor
    private let router = CharacterListViewRouter()
    
    @Published var model : [BreakingBadCharacter] = []
    
    init(interactor: CharacterListInteractor){
        self.interactor = interactor
        self.interactor.delegate = self
    }
    
    
    func getCharacterList(){
        self.interactor.getCharacterList()
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
