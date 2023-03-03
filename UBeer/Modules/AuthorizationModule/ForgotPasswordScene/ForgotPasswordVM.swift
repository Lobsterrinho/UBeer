//
//  ForgotPasswordVM.swift
//  UBeer
//
//  Created by Lobster on 4.03.23.
//

import UIKit

final class ForgotPasswordVM: ForgotPasswordVMProtocol {
    
    private var authorizationService: ForgotPasswordAuthorizationServiceProtocol
    private weak var coordinator: ForgotPasswordCoordinatorProtocol?
    
    init(authorizationService: ForgotPasswordAuthorizationServiceProtocol,
         coordinator: ForgotPasswordCoordinatorProtocol) {
        self.authorizationService = authorizationService
        self.coordinator = coordinator
    }
    
    func forgotPassword() {
        authorizationService.forgotPassword()
        coordinator?.finish()
    }
    
}
