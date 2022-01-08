//
//  FirebaseCombine.swift
//  hanasukotonai
//
//  Created by rhythm191 on 2022/01/08.
//

import Foundation
import Combine
import FirebaseFirestore

extension Firestore {
    
    func fetchAll<T: EntityProtocol>(collectionKey: String) -> AnyPublisher<[T], Error> {
        return Future<[T], Error> { [weak self] promise in
            self?.collection(collectionKey).getDocuments() { snapshot, error in
                if let err = error {
                    promise(.failure(err))
                }
                if let snapshot = snapshot {
                    let entities: [T] = snapshot.documents.compactMap { T.decode(document: $0.data()) }
                    promise(.success(entities))
                }
            }
        }.eraseToAnyPublisher()
    }
}
