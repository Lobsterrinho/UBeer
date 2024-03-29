//
//  LoginVMProtocol.swift
//  UBeer
//
//  Created by Lobster on 28.02.23.
//

import Foundation

protocol LoginVMProtocol {
    
    func login(email: String?, password: String?)
    func openRegisterScene(email: String?)
    func openForgotPasswordScene(email: String?)
    func setupViewDelegate(_ delegate: LoginVMDelegate)
}
