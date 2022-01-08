//
//  ContentView.swift
//  hanasukotonai
//
//  Created by rhythm191 on 2022/01/08.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @ObservedObject var topicViewModel: TopicViewModel

    var body: some View {
        NavigationView {
            VStack {
                Text(LocalizedStringKey(topicViewModel.currentTopic.titleId))
                    .padding(.bottom)
                    .font(.largeTitle)
                
                Button(action: {
                    topicViewModel.changeTopic()
                }) {
                    Text("change topic")
                        .foregroundColor(.white)
                }
                .padding(.all)
                .background(Color.blue)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(topicViewModel: TopicViewModel())
            .environment(\.locale, .init(identifier: "ja"))
    }
}
