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

final class RealtimeDatabaseService: RealtimeDatabaseServiceProtocol {
    
    private enum Const {
        static let path: String = "checkIn"
    }
    
    private let firebaseReference = Database.database(url: "https://ubeer-df05b-default-rtdb.europe-west1.firebasedatabase.app/")
    #warning("change to protocol")
    private var firebaseAuthService = AuthorizationService()
    
    func createCheckIn(model: CheckInModel) {
        var currentUser: FirebaseAuth.User?
        firebaseAuthService.getCurrentUser { user in
            currentUser = user
        }
        #warning("delete force unwrap")
        let dict: [String: Any] = ["longitude": model.longitude,
                                   "latitude": model.latitude,
                                   "numberOfPeople": model.numberOfPeople,
                                   "wishes": model.wishes,]
        self.firebaseReference
            .reference()
            .child("\(currentUser!.uid)_\(UInt.random(in: UInt.min...UInt.max))")
            .setValue(dict)
        
    }
    
    private func checkIns() {
        
    
//    func loadUsers(completion: @escaping (User?, Error?) -> Void) {
        
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
//    }
        
    }
}
