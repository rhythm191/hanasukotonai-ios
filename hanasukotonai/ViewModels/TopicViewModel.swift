//
//  TopicViewModel.swift
//  hanasukotonai
//
//  Created by rhythm191 on 2022/01/08.
//

import Foundation
import Combine

public class TopicViewModel: ObservableObject {
    let defaultTopic: Topic = Topic(id: "h4zxbacIgeFiVcwatbVA", titleId: "topic_about_career");
    
    @Published var currentTopic: Topic;
    var topics: [Topic] = [];
    
    var cancellables: Set<AnyCancellable> = []
    
    
    init(with repository: TopicRepository = TopicRepository()) {
        self.currentTopic = defaultTopic;
        
        repository.getTopics()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { [weak self] topics in
                    self?.topics = topics
                    self?.currentTopic = topics[0]
                }).store(in: &cancellables)
    }
    deinit {
        cancellables.forEach { $0.cancel() }
    }
    
    public func changeTopic() {
        self.currentTopic = topics.randomElement() ?? defaultTopic
    }
}
