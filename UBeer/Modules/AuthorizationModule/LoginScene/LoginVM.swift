//
//  LoginVM.swift
//  UBeer
//
//  Created by Lobster on 28.02.23.
//

import UIKit

final class LoginVM: LoginVMProtocol {
    
    private var authorizationService: LoginAuthorizationServiceProtocol
    private weak var coordinator: LoginCoordinatorProtocol?
    private var alertFactory: AlertControllerFactoryProtocol
    
    init(authorizationService: LoginAuthorizationServiceProtocol,
         coordinator: LoginCoordinatorProtocol,
         alertFactory: AlertControllerFactoryProtocol) {
        self.authorizationService = authorizationService
        self.coordinator = coordinator
        self.alertFactory = alertFactory
    }
    
    func login() {
        authorizationService.login()
//        coordinator?.finish()
        openAlert()
    }
    
    func openRegisterScene() {
        coordinator?.openRegisterScene()
    }
    
    func openForgotPasswordScene() {
        coordinator?.openForgotPasswordScene()
    }
    
    private func openAlert() {
        let alert = alertFactory.makeAlert(title: "Succes", message: "You are logged in", actions: [.cancel({
            //place for handler
        })])
        coordinator?.presentAlert(alert)
    }
    
}
