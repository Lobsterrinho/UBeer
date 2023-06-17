//
//  DatabaseCurrentUserProtocol.swift
//  UBeer
//
//  Created by Lobster on 17.06.23.
//

import Foundation
import FirebaseAuth

protocol DatabaseCurrentUserProtocol {
    func getCurrentUser(completion: @escaping (FirebaseAuth.User?) -> Void)
}
