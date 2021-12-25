//
//  SheetView.swift
//  BreakingBad
//
//  Created by Hugo Reyes on 12/24/21.
//

import SwiftUI

enum Season: String, CaseIterable, Identifiable {
    case all
    case one
    case two
    case three
    case four
    case five
    
    var id: String { self.rawValue}
}


struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var selectedOption : Season

    var body: some View {
        NavigationView{
        VStack{
    
            
            Text("Filter by Season:")
            
            
            Picker("Season", selection: $selectedOption){
                Text("All").tag(Season.all)
                Text("Season One").tag(Season.one)
                Text("Season Two").tag(Season.two)
                Text("Season Three").tag(Season.three)
                
            }
            
        
            Spacer()
        }
        

        .navigationBarTitle(Text("Filters"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                print("Dismissing sheet view...")
                
                
            }) {
                Text("Save").bold()
            })
        }
    }
}


//
//struct SheetView_Previews: PreviewProvider {
//
//
//    let t = Session.all
//    static var previews: some View {
//        SheetView(selectedOption: l)
//    }
//}
