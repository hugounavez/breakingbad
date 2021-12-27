//
//  SearchBarView.swift
//  BreakingBad
//
//  Created by Hugo Reyes on 12/26/21.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchText: String
    @Binding var isSearching: Bool
    
    var body: some View {
        HStack {
            HStack {
                TextField("Search by name", text: $searchText)
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
                .animation(.spring(), value: 10)
            //.animation(.spring())
            
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
    
