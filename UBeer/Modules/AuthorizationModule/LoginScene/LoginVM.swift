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
    
    var email: String
    
    init(email: String, authorizationService: LoginAuthorizationServiceProtocol,
         coordinator: LoginCoordinatorProtocol,
         alertFactory: AlertControllerFactoryProtocol) {
        self.authorizationService = authorizationService
        self.coordinator = coordinator
        self.alertFactory = alertFactory
        self.email = email
    }
    
    func login() {
        authorizationService.login()
        openAlert()
    }
    
    func openRegisterScene(email: String?) {
        coordinator?.openRegisterScene(delegate: self, email: email)
    }
    
    func openForgotPasswordScene(email: String?) {
        coordinator?.openForgotPasswordScene(delegate: self, email: email)
    }
    
}

extension LoginVM: RegisterVMDelegate {
    
    func RegisterFinished(with login: String) {
        email = login
    }
}

extension LoginVM: ForgotPasswordVMDelegate {
    
    func passwordChanged(with email: String) {
        self.email = email
    }
}

extension LoginVM {
    
    private func openAlert() {
        let alert = alertFactory.makeAlert(title: "Succes", message: "You are logged in", actions: [.cancel({
            //place for handler
        })])
        coordinator?.presentAlert(alert)
    }
    
}
