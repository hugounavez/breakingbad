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
                }
                
            }
            .navigationBarTitle(Text("About me"), displayMode: .automatic)
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
