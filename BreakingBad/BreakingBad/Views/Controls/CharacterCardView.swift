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
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                            .frame(width: 220, height: 300, alignment: .center)
                    }).resizable()
                        .frame(width: 220, height: 300, alignment: .center)
                }
            }
            
            if let name = self.presenter.model.name {
                Text(name)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 180, height: 25, alignment: .leading).padding(.leading)
                    
            }
            
            if let nickname = self.presenter.model.nickname{
                Text(nickname)
                    .foregroundColor(.white)
                    .frame(width: 180, height: 25, alignment: .leading).padding(.leading)
            }
             
            
            Text("Seasons").fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 180, height: 25, alignment: .leading).padding(.leading)
            
            
            Text(self.presenter.model.seasons).fontWeight(.regular)
                .foregroundColor(.white)
                .frame(width: 180, height: 25, alignment: .leading).padding(.leading).padding(.bottom)
            
            
        }.background(
            LinearGradient(gradient: Gradient(colors: [.green, Color(red: 0.001, green: 0.177, blue: -0.001)]), startPoint: .top, endPoint: .bottom))

            .cornerRadius(20)
          
    }
}

struct CharacterCardView_Previews: PreviewProvider {
    static var previews: some View {
        let interactor = CharacterCardViewInteractor(model: MockUpDataModel.data[0])
        let presenter = CharacterCardViewPresenter(interactor: interactor)
        
        Group {
            VStack{
                Text("tes")
                CharacterCardView(presenter: presenter).padding()
            }.background(Color(red: 0.997, green: 0.69, blue: 0.018))
        }
    }
}
