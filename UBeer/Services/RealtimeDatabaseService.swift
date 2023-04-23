//
//  RealtimeDatabaseService.swift
//  UBeer
//
//  Created by Lobster on 10.04.23.
//

import Foundation
import UIKit
import FirebaseDatabase
import FirebaseAuth

struct User: Decodable {
    var name: String
}

final class RealtimeDatabaseService {
    
    private var firebaseReference: DatabaseReference!
    private var firebaseAuthService = Auth.auth()
    
    func loadUsers(completion: @escaping (User?, Error?) -> Void) {
        
//        firebaseReference = Database.database(url: "https://ubeer-df05b-default-rtdb.europe-west1.firebasedatabase.app")
//            .reference()
//            .child("users")
//        firebaseReference.observe(.value) { dataSnapshot in
//            if let jsonData = dataSnapshot.value {
//                do {
//                    let data = try JSONSerialization.data(withJSONObject: jsonData)
//                    let users = try JSONDecoder().decode(User.self, from: data)
//                    print(users.name)
//                } catch {
//                    print(error.localizedDescription)
//                }
//            }
//        }
    }
    
    func addUser() {
        print("\n\n\n\n\n\n")
        let currentUser = firebaseAuthService.currentUser
        let uid = currentUser?.uid
//        print(uid)
        
//        let dictt: [String: Any] = ["id": "\(firebaseAuthService.user)",
//                                    "name": "Aboba"]
//        self.firebaseReference.child("users").setValue(dictt)
        
    }
}
