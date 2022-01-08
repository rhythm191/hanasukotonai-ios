//
//  TopicViewModel.swift
//  hanasukotonai
//
//  Created by rhythm191 on 2022/01/08.
//

import Foundation

public class TopicViewModel: ObservableObject {
    
    @Published var topic: Topic;
    
    init(topic: Topic) {
        self.topic = topic
    }
    
}
