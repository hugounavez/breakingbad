//
//  CharacterListView.swift
//  BreakingBad
//
//  Created by Hugo Reyes on 12/16/21.
//

import SwiftUI

struct CharacterListView: View {
    
    @ObservedObject var presenter : CharacterListPresenter
    @State private var showingSheet = false
    
    
    var body: some View {
        
        NavigationView{
            VStack{
                List{
                    if (self.presenter.model.count > 0){
                    
                    ForEach(0...self.presenter.model.count - 1, id: \.self){
                        index in
                     
                        let model = self.presenter.model[index]
                        self.presenter.linkBuilder(for: model) {
                            CharacterCardView(presenter: CharacterCardViewPresenter(interactor: CharacterCardViewInteractor(model: model)))
                        }
                        
                    }
                
                    }
                    
                }.navigationTitle("Breaking Bad")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("+") {
                                print("Help tapped!")
                                showingSheet.toggle()
                            }.sheet(isPresented: $showingSheet) {
                                SheetView()
                            }
                        }
                    }
                
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


struct SheetView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button("Press to dismiss") {
            dismiss()
        }
        .font(.title)
        .padding()
        .background(Color.black)
    }
}
