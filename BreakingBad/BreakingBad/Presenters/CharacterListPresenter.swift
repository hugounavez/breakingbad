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


class CharacterListPresenter : ObservableObject, CharacterListPresenterUseCase, ModelListTransferProtocol{
    public var interactor : CharacterListInteractor
    //private let router = CharacterListViewRouter()
    
    @Published var model : [BreakingBadCharacter] = []
    @Published var season : Season = .all {
        didSet{
            self.updateSearch()
        }
    }
    @Published var searchText = "" {
        didSet{
        self.updateSearch()
        }
    }
    
    init(interactor: CharacterListInteractor){
        self.interactor = interactor
        self.interactor.delegate = self
    }
    
    func updateSearch(){
        print(self.season)
        guard self.searchText != "" else{
            self.interactor.filterBySeason(season: self.season)
            return
        }
        self.interactor.filterByNameAndSeason(searchText: self.searchText, season: self.season)
    }
    
    func modelHasChanged(data: [BreakingBadCharacter]) {
        self.model = data
    }
    
    func getCharacterList(){
        self.interactor.getCharacterList()
    }
    
//    func linkBuilder<Content: View>(
//        for trip: BreakingBadCharacter,
//        @ViewBuilder content: () -> Content
//    ) -> some View {
//        NavigationLink(
//            destination: router.makeDetailView(
//                for: trip)) {
//                    content()
//                }
//    }
    
}
