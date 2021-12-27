//
//  CharacterCardView.swift
//  BreakingBad
//
//  Created by Hugo Reyes on 12/17/21.
//

import SwiftUI
import Kingfisher

struct CharacterCardView: View {
    
    @ObservedObject var presenter : CharacterCardViewPresenter
    
    var body: some View {
        VStack{
            if let imageUrl = self.presenter.model.img {
                if let url = URL(string: imageUrl){
                    KFImage(url).placeholder({
                        Image("araguaney").resizable()
                            //.aspectRatio(contentMode: .fill)
                            .cornerRadius(10)
                            .frame(width: 250, height: 350, alignment: .center)
                    }).resizable()
                        .cornerRadius(10)
                        .frame(width: 250, height: 350, alignment: .center)
                }
            }
            
            if let name = self.presenter.model.name {
                Text(name)
                    .fontWeight(.medium)
                    .frame(width: 250, height: 25, alignment: .leading)
                    
            }
            
            if let nickname = self.presenter.model.nickname{
                Text(nickname)
                    .frame(width: 250, height: 25, alignment: .leading)
            }
             
            
            Text("Seasons").fontWeight(.medium)
                .frame(width: 250, height: 25, alignment: .leading)
            
            
            Text(self.presenter.model.seasons).fontWeight(.regular)
                .frame(width: 250, height: 25, alignment: .leading)
            
            
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
