//
//  TopicRepository.swift
//  hanasukotonai
//
//  Created by rhythm191 on 2022/01/08.
//

import Foundation
import Combine
import FirebaseFirestore

class TopicRepository {
    
    public func getTopics() -> AnyPublisher<[Topic], Error> {
        let db = Firestore.firestore()
        
        return Future<[Topic], Error> { promise in
            db.collection("topics").getDocuments() { snapshot, error in
                if let err = error {
                    promise(.failure(err))
                }
                if let snapshot = snapshot {
                    let topics: [Topic] = snapshot.documents.compactMap { Topic(id: $0.documentID, titleId: $0.data()["titleId"] as! String) }
                    promise(.success(topics))
                }
            }
        }.eraseToAnyPublisher()
    }
}
