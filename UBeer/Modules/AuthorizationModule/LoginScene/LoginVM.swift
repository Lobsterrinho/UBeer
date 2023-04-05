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
    private weak var delegate: LoginVMDelegate?
    
    init(authorizationService: LoginAuthorizationServiceProtocol,
         coordinator: LoginCoordinatorProtocol,
         alertFactory: AlertControllerFactoryProtocol) {
        self.authorizationService = authorizationService
        self.coordinator = coordinator
        self.alertFactory = alertFactory
    }
    
    func login(email: String?, password: String?) {
        guard let email = email, !email.isEmpty,
              let password = password, !password.isEmpty && password != ""
        else {
            openAlert(title: "Сheck the entered data",
                      message: "Login and/or password can't be empty",
                      shouldCloseScene: false)
            return }
        authorizationService.login(email: email, password: password) { error in
            if error != nil {
                self.openAlert(title: "Something went wrong",
                               message: error?.localizedDescription,
                               shouldCloseScene: false)
            } else {
                self.openAlert(title: "Success",
                               message: "You've succesfully signed in",
                               shouldCloseScene: true)
                let userDefaults = UserDefaults.standard
                userDefaults.set(true, forKey: "isRegistered")
            }
        }
    }
    
    func openRegisterScene(email: String?) {
        coordinator?.openRegisterScene(delegate: self,
                                       email: email)
    }
    
    func openForgotPasswordScene(email: String?) {
        coordinator?.openForgotPasswordScene(delegate: self,
                                             email: email)
    }
    
    func setupViewDelegate(_ delegate: LoginVMDelegate) {
        self.delegate = delegate
    }
}

extension LoginVM: RegisterVMDelegate {
    
    func RegisterFinished(with login: String) {
        delegate?.getEmail(login)
    }
}

extension LoginVM: ForgotPasswordVMDelegate {
    
    func passwordChanged(with email: String) {
        delegate?.getEmail(email)
    }
}

extension LoginVM {
    
    private func openAlert(title: String?,
                           message: String?,
                           shouldCloseScene: Bool) {
        let alert = alertFactory.makeAlert(title: title,
                                           message: message,
                                           actions: [.default("Okay", {
            if shouldCloseScene {
                self.coordinator?.finish()
            }
        })])
        coordinator?.presentAlert(alert)
    }
    
}
