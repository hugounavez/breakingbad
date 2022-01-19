//
//  BreakingBadApp.swift
//  BreakingBad
//
//  Created by Hugo Reyes on 12/16/21.
//

import SwiftUI


struct CustomTabView: View {
    @State var selectedTab = "house.fill"
    var images = ["house.fill", "person.crop.circle"]
    let model =  [BreakingBadCharacter(name: "", id: 1, birthday: "", img: "", status: "", nickname: "", portrayed: "", category: "", occupation: [""], appearance: [1])]
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
        //VStack(spacing: 0){
//
            switch selectedTab {
            case "house.fill":
            CharacterListView(presenter: CharacterListPresenter(interactor: CharacterListInteractor(model: model)))
            default:
                AboutView()
            }
//

//            TabView(selection: $selectedTab){
//                
//                CharacterListView(presenter: CharacterListPresenter(interactor: CharacterListInteractor(model: model))).tag("house.fill")
//                
//                AboutView().tag("person.crop.circle")
//                
//            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//                .ignoresSafeArea(.all, edges: .bottom)
//            
            
            
            
            
            
            
            HStack(spacing: 0){
                
            Spacer()
            ForEach(images, id: \.self){ num in
                TabButton(image: num, selectedTab: $selectedTab)
                    Spacer()
                // equal spacing...
                    //if (num != images.last){
                     //   Spacer(minLength: 0)
                   // }
            }
            
            
                // End of HStack
            }
            
            
        .padding(.horizontal, 25)
        .padding(.vertical, 5)
        .background(Color.white)
        .clipShape(Capsule())
        .shadow(color: Color.black.opacity(0.15), radius: 5, x: 5, y: 5)
        .shadow(color: Color.black.opacity(0.15), radius: 5, x: -5, y: -5)
        .padding(.horizontal)
        .padding(.bottom, 10)
            

        }             // ignoring tabview elevation...
        .ignoresSafeArea(.keyboard, edges: .bottom)
        
        .onAppear {
            
            //self.selectedTab = "house.fill"
        }
        
        .onDisappear {
        }
    }
}


struct TabButton : View {
    var image : String
    @Binding var selectedTab : String
    var body: some View {
        Button(action: {selectedTab = image}){
            
            Image(systemName: image)
                .renderingMode(.template)
                .foregroundColor(selectedTab == image ? Color.black : Color.black.opacity(0.4))
                .padding()
            
        }
    }
}


@main
struct BreakingBadApp: App {
    let persistenceController = PersistenceController.shared
    let model =  [BreakingBadCharacter(name: "Pepe", id: 1, birthday: "123", img: "", status: "SDS", nickname: "sds", portrayed: "sedsd", category: "sdsd", occupation: [":23"], appearance: [1])]
    var body: some Scene {
        WindowGroup {
            //CharacterListView(presenter: CharacterListPresenter(interactor: CharacterListInteractor(model: model)))
            //MainTabView()
            CustomTabView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
