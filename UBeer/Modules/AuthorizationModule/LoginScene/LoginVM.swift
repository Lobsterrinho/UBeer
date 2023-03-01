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
    
    init(authorizationService: LoginAuthorizationServiceProtocol,
         coordinator: LoginCoordinatorProtocol) {
        self.authorizationService = authorizationService
        self.coordinator = coordinator
    }
    
    func login() {
        authorizationService.login()
        coordinator?.finish()
    }
    
    func openRegisterScene() {
        coordinator?.openRegisterScene()
    }
    
    func openForgotPasswordScene() {
        coordinator?.openForgotPasswordScene()
    }
    
}
