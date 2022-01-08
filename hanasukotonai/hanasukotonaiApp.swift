//
//  hanasukotonaiApp.swift
//  hanasukotonai
//
//  Created by rhythm191 on 2022/01/08.
//

import SwiftUI
import Firebase

@main
struct hanasukotonaiApp: App {
    let persistenceController = PersistenceController.shared
    
    init(){
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView(topicViewModel: TopicViewModel())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
