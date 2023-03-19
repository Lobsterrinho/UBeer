//
//  LoginAuthorizationServiceProtocol.swift
//  UBeer
//
//  Created by Lobster on 28.02.23.
//

import Foundation


protocol LoginAuthorizationServiceProtocol {
    
    func login(email: String, password: String, completion: @escaping (Error?) -> Void)
    
}
