//
//  ForgotPasswordAuthorizationServiceProtocol.swift
//  UBeer
//
//  Created by Lobster on 4.03.23.
//

import UIKit

protocol ForgotPasswordAuthorizationServiceProtocol {
    
    func forgotPassword(email: String, completion: @escaping (Error?) -> Void)
    
}
