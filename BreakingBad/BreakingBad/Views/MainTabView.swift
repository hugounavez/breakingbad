//
//  MainTabView.swift
//  BreakingBad
//
//  Created by Hugo Reyes on 12/19/21.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        let model =  [BreakingBadCharacter(name: "", id: 1, birthday: "", img: "", status: "", nickname: "", portrayed: "", category: "", occupation: [""], appearance: [1])]
        
        TabView{
            
            CharacterListView(presenter: CharacterListPresenter(interactor: CharacterListInteractor(model: model))).tabItem {
                Image(systemName: "house.fill")
                Text("Home")
                
            }
            
            SearchView().tabItem {
                Image(systemName: "magnifyingglass")
                Text("Test")
            }
        }
        
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
