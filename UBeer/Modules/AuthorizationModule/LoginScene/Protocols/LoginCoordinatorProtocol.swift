//
//  LoginCoordinatorProtocol.swift
//  UBeer
//
//  Created by Lobster on 28.02.23.
//

import UIKit

protocol LoginCoordinatorProtocol: AnyObject {
    
    func openRegisterScene()
    func openForgotPasswordScene()
    func presentAlert(_ alert: UIViewController)
    func finish()
    
}
