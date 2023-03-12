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
    
    private var email: String?
    
    init(email: String?,
         authorizationService: ForgotPasswordAuthorizationServiceProtocol,
         coordinator: ForgotPasswordCoordinatorProtocol) {
        self.authorizationService = authorizationService
        self.coordinator = coordinator
        self.email = email
    }
    
    func forgotPassword() {
        authorizationService.forgotPassword()
    }
    
    func finish(shouldMoveToParent: Bool) {
        coordinator?.finish(shouldMoveToParent: shouldMoveToParent)
    }
    
    func setupLoginTextField(completion: (String?) -> Void) {
        completion(email)
    }
    
}
