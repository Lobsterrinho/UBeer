//
//  AuthorizationService.swift
//  UBeer
//
//  Created by Lobster on 28.02.23.
//

import Foundation

final class AuthorizationService {
    
    func login() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            print("You are logged in")
        }
    }
    
    func register() {
        print("\(#function)")
    }
    
    func forgotPassword() {
        print("\(#function)")
    }
    
    func checkOTP() {
        print("\(#function)")
    }
    
}
