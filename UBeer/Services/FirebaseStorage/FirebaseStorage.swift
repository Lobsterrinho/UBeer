//
//  FirebaseStorage.swift
//  UBeer
//
//  Created by Lobster on 11.07.23.
//

import Foundation
import FirebaseStorage

enum FirebaseStorageEndpoints {
    static let avatars: String = "images/avatars"
    static let checkInImages: String = "images/checkInImages"
}


final class FirebaseStorage {
    
    private let reference = Storage.storage().reference()
    
    func uploadImage(path: String,
                     imageData: Data?,
                     userID: String,
                     completion: @escaping (Result<URL?, Error>) -> Void) {
        let path = reference.child(path).child("\(userID)_\(UInt16.random(in: UInt16.min...UInt16.max))")
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        if imageData != nil {
            guard let imageData = imageData else { return }
            
            path.putData(imageData,
                         metadata: metadata) { metadata, error in
                guard let _ = metadata else {
                    completion(.failure(error!))
                    return
                }
                path.downloadURL { url, error in
                    guard let url = url else {
                        completion(.failure(error!))
                        return
                    }
                    completion(.success(url))
                }
            }
        } else {
            completion(.success(nil))
        }
    }
}
