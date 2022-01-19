//
//  CharacterDetailView.swift
//  BreakingBad
//
//  Created by Hugo Reyes on 12/19/21.
//

import SwiftUI
import Kingfisher

struct DetailLabelTitleSection : View {
    var mainLabel : String
    var body: some View {
        HStack{
            Text(mainLabel).fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 250, height: 35, alignment: .leading)
        }
    }
}

struct DetailLabelSubtitleSection : View {
    var label : String
    var body: some View {
        HStack{
            Text(label).fontWeight(.regular)
                .foregroundColor(.white)
                .frame(width: 250, height: 35, alignment: .leading)
     
        }
    }
}

struct CharacterDetailView: View {
    @ObservedObject  var presenter: CharacterDetailPresenter
    var body: some View {
        Group{
            ZStack{
                VStack{
                    Color(red: 0.001, green: 0.177, blue: -0.001).edgesIgnoringSafeArea(.all)
                }
                
                ScrollView(showsIndicators: false){
                VStack (alignment: .center, spacing: 1){
                    
                    if let imageUrl = self.presenter.model.img {
                        if let url = URL(string: imageUrl){
                            KFImage(url).placeholder({
                                Image("araguaney").resizable()
                                //.aspectRatio(contentMode: .fill)
                                    .foregroundColor(Color(red: 0.286, green: 0.566, blue: 0.33))
                                    .padding()
                                    .cornerRadius(10)
                                    .frame(width: 250, height: 350, alignment: .center)
                            }).resizable()
                                .cornerRadius(10)
                                .frame(width: 250, height: 350, alignment: .center)
                        }
                    }
                    
                    
                    DetailLabelTitleSection(mainLabel: "Name")
                    
                    if let name = self.presenter.model.name {
                        DetailLabelSubtitleSection(label: name)
                    }
                    
                    DetailLabelTitleSection(mainLabel: "Status")
                    
                    if let status = self.presenter.model.status {
                        DetailLabelSubtitleSection(label: status)
                    }
                    
                    DetailLabelTitleSection(mainLabel: "Nickname")
                    
                    if let nickname = self.presenter.model.nickname {
                        DetailLabelSubtitleSection(label: nickname)
                    }
                    
                    DetailLabelTitleSection(mainLabel: "Seasons")
                    
                    DetailLabelSubtitleSection(label: self.presenter.model.seasons).padding(.bottom, 80)
                    //72 144 84
                    
                } // End of VStack
                
            }
            .padding(.top, 70)
            
                    .navigationBarTitle(Text(""), displayMode: .inline)
                    .edgesIgnoringSafeArea(.all)
            }
            
           

        }.onAppear {

            
            //UINavigationBar.changeAppearance(clear: true)
        }
    
    }
}

//struct CharacterDetailView_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        let model = BreakingBadCharacter(name: "Juanchope", id: 1, birthday: "", img: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/Szczenie_Jack_Russell_Terrier3.jpg/711px-Szczenie_Jack_Russell_Terrier3.jpg", status: "Perrito", nickname: "El zurdo", portrayed: "", category: "-", occupation: ["S"], appearance: [1])
//        
//        let interactor =  CharacterDetailInteractor(model: model)
//        let presenter = CharacterDetailPresenter(interactor: interactor)
//        
//        CharacterDetailView(presenter: presenter)
//    }
//}
