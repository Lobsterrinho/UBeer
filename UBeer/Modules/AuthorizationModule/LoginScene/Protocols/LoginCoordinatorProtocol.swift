//
//  LoginCoordinatorProtocol.swift
//  UBeer
//
//  Created by Lobster on 28.02.23.
//

import UIKit

protocol LoginCoordinatorProtocol: AnyObject {
    
    func openRegisterScene(delegate: RegisterViewModelDelegate, email: String?)
    func openForgotPasswordScene(email: String?)
    func presentAlert(_ alert: UIViewController)
    func finish()
    
}
