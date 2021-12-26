//
//  SearchView.swift
//  BreakingBad
//
//  Created by Hugo Reyes on 12/20/21.
//

import SwiftUI


struct SearchView: View {
    @State var isSearching = false
    @ObservedObject var presenter : SearchViewPresenter
    @State private var showingSheet = false
    
    @State var test = false
    
    var body: some View {
        NavigationView {
            ZStack{

                
                
        VStack {
            SearchBar(searchText: $presenter.searchText, isSearching: $isSearching)
            

                List{
                    if (self.presenter.model.count > 0){
                        ForEach(0...self.presenter.model.count - 1, id: \.self) { index in
                            let model = self.presenter.model[index]
                            CharacterCardView(presenter: CharacterCardViewPresenter(interactor: CharacterCardViewInteractor(model: model)))

                        }
                    }
                }
            
        }
            
                if (test){
                    
                    VStack{
                        
                        Text("Filter by session: ").padding()
                        
                        Picker("Season", selection: $presenter.season){
                            Text("All").tag(Season.all)
                            Text("Season One").tag(Season.one)
                            Text("Season Two").tag(Season.two)
                            Text("Season Three").tag(Season.three)
                            
                        }.background(.white)
    
                        Button("Dismiss") {
                            //self.test = false
                        }.cornerRadius(10)
                        .background(.brown)
                        
                        
                    }.background(.white)
                        .cornerRadius(10)
                        //.frame(width: 400, height: 400, alignment: .center)
                    
                }
                
            }
            
        .navigationTitle("Search")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("+") {
                    print("Help tapped!")
                    //showingSheet.toggle()
                    self.test.toggle()
                }.sheet(isPresented: $showingSheet) {
                    SheetView(selectedOption: $presenter.season)
                }
            }
        }
        }
        
        .onAppear {
            self.presenter.getCharacterList()
        }
        
    }
    

    
}




struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        let model = BreakingBadCharacter(name: "Juanchope", id: 1, birthday: "", img: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/Szczenie_Jack_Russell_Terrier3.jpg/711px-Szczenie_Jack_Russell_Terrier3.jpg", status: "Perrito", nickname: "El zurdo", portrayed: "", category: "-", occupation: ["S"], appearance: [1])
        let interactor = SearchViewInteractor(model: [model])
        let presenter = SearchViewPresenter(interactor: interactor)
        
        SearchView(presenter: presenter)
    }
}


struct SearchBar: View {
    
    @Binding var searchText: String
    @Binding var isSearching: Bool
    
    var body: some View {
        HStack {
            HStack {
                TextField("Search terms here", text: $searchText)
                    .padding(.leading, 24)
            }
            .padding()
            .background(Color(.systemGray5))
            .cornerRadius(6)
            .padding(.horizontal)
            .onTapGesture(perform: {
                isSearching = true
            })
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                    Spacer()
                    
                    if isSearching {
                        Button(action: { searchText = "" }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .padding(.vertical)
                        })
                        
                    }
                    
                }.padding(.horizontal, 32)
                .foregroundColor(.gray)
            ).transition(.move(edge: .trailing))
            .animation(.spring())
            
            if isSearching {
                Button(action: {
                    isSearching = false
                    searchText = ""
                    
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    
                }, label: {
                    Text("Cancel")
                        .padding(.trailing)
                        .padding(.leading, 0)
                })
                .transition(.move(edge: .trailing))
                .animation(.spring())
            }
            
        }
    }
}
    
