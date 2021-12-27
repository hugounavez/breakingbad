//
//  FilterDialog.swift
//  BreakingBad
//
//  Created by Hugo Reyes on 12/26/21.
//

import SwiftUI

struct FilterDialog: View {
    
    @Binding var selectedSeason: Season
    @Binding var filterVisible : Bool
    
    var body: some View {
        VStack{
            
            Text("Filter by session: ").fontWeight(.bold).padding()
            
            Picker("Season", selection: $selectedSeason){
                Text("All").tag(Season.all)
                Text("Season One").tag(Season.one)
                Text("Season Two").tag(Season.two)
                Text("Season Three").tag(Season.three)
                
            }
            
            Button(action:{
                self.filterVisible = false
            }) {
                HStack {
                    Spacer()
                    Text("Dimiss")
                    Spacer()
                }
                .frame(width: 150, height: 30, alignment: .center)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(5)
                .padding()
            }
        }
        .frame(width: 220, height: 200, alignment: .center)
        
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color.gray, lineWidth: 1))
        .background(.white)
        .cornerRadius(25)
    }
}

struct FilterDialog_Previews: PreviewProvider {
    @State static var season = Season.all
    @State static var filterVisible = true
    static var previews: some View {
        
        
        FilterDialog(selectedSeason: $season, filterVisible: $filterVisible)
    }
}
