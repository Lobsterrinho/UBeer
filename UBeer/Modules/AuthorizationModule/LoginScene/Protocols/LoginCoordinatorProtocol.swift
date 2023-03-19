//
//  LoginCoordinatorProtocol.swift
//  UBeer
//
//  Created by Lobster on 28.02.23.
//

import UIKit

protocol LoginCoordinatorProtocol: AnyObject {
    
    func openRegisterScene(delegate: RegisterVMDelegate?, email: String?)
    func openForgotPasswordScene(delegate: ForgotPasswordVMDelegate?, email: String?)
    func presentAlert(_ alert: UIViewController)
    func finish()
    
}
