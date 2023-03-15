//
//  LoginVMProtocol.swift
//  UBeer
//
//  Created by Lobster on 28.02.23.
//

import Foundation

protocol LoginVMProtocol {
    
    func login()
    func openRegisterScene(email: String?)
    func openForgotPasswordScene(email: String?)
    var email: String { get }
}
