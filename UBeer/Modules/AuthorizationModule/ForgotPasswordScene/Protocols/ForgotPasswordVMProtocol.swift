//
//  ForgotPasswordVMProtocol.swift
//  UBeer
//
//  Created by Lobster on 4.03.23.
//

import UIKit

protocol ForgotPasswordVMProtocol {
    
    func forgotPassword(email: String?)
    func finish(shouldMoveToParent: Bool)
    
    var email: String? { get }
}
