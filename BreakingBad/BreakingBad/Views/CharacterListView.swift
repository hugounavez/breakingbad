//
//  CharacterListView.swift
//  BreakingBad
//
//  Created by Hugo Reyes on 12/16/21.
//

import SwiftUI

struct CharacterListView: View {
    
    @ObservedObject var presenter : CharacterListPresenter
    @State var isSearching = false
    @State var filterVisible = false
    
    var body: some View {
        
        NavigationView{
            ZStack{
                VStack{
                    SearchBar(searchText: $presenter.searchText, isSearching: $isSearching)
                    
                    List{
                        if (self.presenter.model.count > 0){
                            
                            ForEach(0...self.presenter.model.count - 1, id: \.self){
                                index in
                                
                                let model = self.presenter.model[index]
                                self.presenter.linkBuilder(for: model) {
                                    HStack{
                                        Spacer()
                                        CharacterCardView(presenter: CharacterCardViewPresenter(interactor: CharacterCardViewInteractor(model: model)))
                                        Spacer()
                                    }
                                }
                                
                            }
                            
                        }
                        
                    }.navigationTitle("Breaking Bad")
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button("...") {
                                    self.filterVisible.toggle()
                                }
                            }
                        }
                    
                } // End of VStack
                
                if (self.filterVisible){
                    FilterDialog(selectedSeason: self.$presenter.season, filterVisible: self.$filterVisible)
                }
                
            } // End of ZStack
            
        } // End of NavigationView
        .onAppear {
            self.presenter.getCharacterList()
        }
    }
    
    
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        let model =  [BreakingBadCharacter(name: "Pepe", id: 1, birthday: "123", img: "", status: "SDS", nickname: "sds", portrayed: "sedsd", category: "sdsd", occupation: [":23"], appearance: [1])]
        let interactor = CharacterListInteractor(model: model)
        let presenter = CharacterListPresenter(interactor: interactor)
        
        CharacterListView(presenter: presenter)
    }
}


