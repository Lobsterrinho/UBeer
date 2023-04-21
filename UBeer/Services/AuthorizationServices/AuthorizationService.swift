//
//  AuthorizationService.swift
//  UBeer
//
//  Created by Lobster on 28.02.23.
//

import Foundation
import FirebaseAuth

final class AuthorizationService {
    
    private var firebaseAuthService = Auth.auth()
    
    func login(email: String,
               password: String,
               completion: @escaping (Error?) -> Void) {
        firebaseAuthService.signIn(withEmail: email,
                                   password: password) { authDataResult, error in
            completion(error)
        }
    }
    
    func register(email: String,
                  password: String,
                  completion: @escaping (Error?) -> Void) {
        firebaseAuthService.createUser(withEmail: email,
                                       password: password) { authDataResult, error in
            completion(error)
        }
    }
    
    func forgotPassword(email: String,
                        completion: @escaping (Error?) -> Void) {
        firebaseAuthService.sendPasswordReset(withEmail: email) { error in
            completion(error)
        }
    }
    
    func signOut(completion: @escaping (NSError?) -> Void) {
        do {
          try firebaseAuthService.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}
