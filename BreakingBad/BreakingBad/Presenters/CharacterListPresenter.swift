//
//  CharacterListPresenter.swift
//  BreakingBad
//
//  Created by Hugo Reyes on 12/19/21.
//

import SwiftUI

class CharacterListPresenter : ObservableObject{
    private var interactor : CharacterListInteractor
    private let router = CharacterListViewRouter()
    
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
