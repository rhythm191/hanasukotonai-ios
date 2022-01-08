//
//  hanasukotonaiApp.swift
//  hanasukotonai
//
//  Created by rhythm191 on 2022/01/08.
//

import SwiftUI

@main
struct hanasukotonaiApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView(topicViewModel: TopicViewModel(topic: Topic(id: "h4zxbacIgeFiVcwatbVA", titleId: "topic_about_career")))
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
