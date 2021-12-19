//
//  CharacterListView.swift
//  BreakingBad
//
//  Created by Hugo Reyes on 12/16/21.
//

import SwiftUI

struct CharacterListView: View {
    
    @ObservedObject var presenter : CharacterListPresenter

    var body: some View {
        
        NavigationView{
            VStack{
                List{
                    ForEach(0...self.presenter.model.count - 1, id: \.self){
                        index in
                        //CharacterCardView()
                        Text("test")
                    }
                    
                }.navigationTitle("Breaking Bad")
                
            } // End of VStack
            
            
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
