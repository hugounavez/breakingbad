//
//  CharacterDetailView.swift
//  BreakingBad
//
//  Created by Hugo Reyes on 12/19/21.
//

import SwiftUI
import Kingfisher


struct CharacterDetailView: View {
    
    @ObservedObject  var presenter: CharacterDetailPresenter
    var body: some View {
        ScrollView{
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
            
            Text("Name").fontWeight(.medium)
                .frame(width: 250, height: 25, alignment: .leading)
            
            if let name = self.presenter.model.name {
                Text(name).fontWeight(.regular)
                    .frame(width: 250, height: 25, alignment: .leading)
            }
            
//            if let occupation = self.presenter.model.occupation {
//                Text(occupation)
//            }
            
            Divider()
            
            Text("Status").fontWeight(.medium)
                .frame(width: 250, height: 25, alignment: .leading)
            if let status = self.presenter.model.status {
                Text(status).fontWeight(.regular)
                    .frame(width: 250, height: 25, alignment: .leading)
            }
            
            Text("Nickname").fontWeight(.medium)
                .frame(width: 250, height: 25, alignment: .leading)
            
            if let nickname = self.presenter.model.nickname {
                Text(nickname).fontWeight(.regular)
                    .frame(width: 250, height: 25, alignment: .leading)
            }
            
            Divider()
             
        } // End of VStack
            
        }
    }
}

struct CharacterDetailView_Previews: PreviewProvider {

    static var previews: some View {
        let model = BreakingBadCharacter(name: "Juanchope", id: 1, birthday: "", img: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/Szczenie_Jack_Russell_Terrier3.jpg/711px-Szczenie_Jack_Russell_Terrier3.jpg", status: "Perrito", nickname: "El zurdo", portrayed: "", category: "-", occupation: ["S"], appearance: [1])
        
        let interactor =  CharacterDetailInteractor(model: model)
        let presenter = CharacterDetailPresenter(interactor: interactor)
        
        CharacterDetailView(presenter: presenter)
    }
}
