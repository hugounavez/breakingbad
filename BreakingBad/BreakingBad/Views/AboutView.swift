//
//  AboutView.swift
//  BreakingBad
//
//  Created by Hugo Reyes on 12/25/21.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationView{
            VStack{
                List {
                    Link("Linkedin", destination: URL(string: "https://www.linkedin.com/in/hugoreyesamell/")!)
                    Link("Personal website", destination: URL(string: "https://www.hugoreyes.info/")!)
                }// Ignore safe area to take up whole screen
//                .listRowBackground(Color.clear.ignoresSafeArea())
//

            }.padding(.bottom)
            .navigationBarTitle(Text("About me"), displayMode: .automatic)
            .background(Color(red: 0.997, green: 0.69, blue: 0.018))
            
        }.onAppear {
            //UITableView.appearance().backgroundColor = UIColor(red: 0.997, green: 0.69, blue: 0.018, alpha: 1)
            
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
