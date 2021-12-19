//
//  CharacterCardView.swift
//  BreakingBad
//
//  Created by Hugo Reyes on 12/17/21.
//

import SwiftUI

struct CharacterCardView: View {
    
    @ObservedObject var presenter : CharacterCardViewPresenter
    
    var body: some View {
        VStack{
            Image("araguaney").resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 320, height: 320, alignment: .center)
            Text(self.presenter.model.name)
            Text(self.presenter.model.nickname)
        }
        
    }
}

struct CharacterCardView_Previews: PreviewProvider {
    static var previews: some View {
        let model = BreakingBadCharacter(name: "Juanchope", id: 1, birthday: "", img: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/Szczenie_Jack_Russell_Terrier3.jpg/711px-Szczenie_Jack_Russell_Terrier3.jpg", status: "", nickname: "El zurdo", portrayed: "", category: "-", occupation: ["S"], appearance: [1])
        let interactor = CharacterCardViewInteractor(model: model)
        let presenter = CharacterCardViewPresenter(interactor: interactor)
        
        Group {
            CharacterCardView(presenter: presenter)
        }
    }
}
