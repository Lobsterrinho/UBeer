//
//  RegisterAuthorizationServiceProtocol.swift
//  UBeer
//
//  Created by Lobster on 1.03.23.
//

import Foundation

protocol RegisterAuthorizationServiceProtocol {
    
    func register(email: String, password: String, completion: @escaping (Error?) -> Void)
    
}
