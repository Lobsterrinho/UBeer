//
//  FirebaseStorageProtocol.swift
//  UBeer
//
//  Created by Lobster on 25.07.23.
//

import Foundation
import UIKit

protocol FirebaseStorageProtocol {
    func uploadImage(path: String,
                     imageData: Data?,
                     userID: String,
                     completion: @escaping (Result<URL, Error>) -> Void)
}
