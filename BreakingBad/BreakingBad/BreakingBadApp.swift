//
//  BreakingBadApp.swift
//  BreakingBad
//
//  Created by Hugo Reyes on 12/16/21.
//

import SwiftUI

@main
struct BreakingBadApp: App {
    let persistenceController = PersistenceController.shared
    let model =  [BreakingBadCharacter(name: "Pepe", id: 1, birthday: "123", img: "", status: "SDS", nickname: "sds", portrayed: "sedsd", category: "sdsd", occupation: [":23"], appearance: [1])]
    var body: some Scene {
        WindowGroup {
            CharacterListView(presenter: CharacterListPresenter(interactor: CharacterListInteractor(model: model)))
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
