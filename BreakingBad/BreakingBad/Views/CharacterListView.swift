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
                            // Ignore safe area to take up whole screen
                            .listRowBackground(Color.clear.ignoresSafeArea())
                        }
                    }// Ignore safe area to take up whole screen
                    .background(Color.purple.ignoresSafeArea())
                        .navigationTitle("Breaking Bad")
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
                
            }.background(Color(red: 0.997, green: 0.69, blue: 0.018)) // End of ZStack
            
        } // End of NavigationView
        .onAppear {
            UITableView.appearance().backgroundColor = UIColor(red: 0.997, green: 0.69, blue: 0.018, alpha: 1)
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


