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
    private var alertFactory: AlertControllerFactoryProtocol
    private weak var delegate: ForgotPasswordVMDelegate?
    
    var email: String?
    
    init(delegate: ForgotPasswordVMDelegate?,
         alertFactory: AlertControllerFactoryProtocol,
         email: String?,
         authorizationService: ForgotPasswordAuthorizationServiceProtocol,
         coordinator: ForgotPasswordCoordinatorProtocol) {
        self.authorizationService = authorizationService
        self.coordinator = coordinator
        self.email = email
        self.alertFactory = alertFactory
        self.delegate = delegate
    }
    
    func forgotPassword(email: String) {
        authorizationService.forgotPassword()
        delegate?.passwordChanged(with: email)
        openAlert()
    }
    
    func finish(shouldMoveToParent: Bool) {
        coordinator?.finish(shouldMoveToParent: shouldMoveToParent)
    }
    
}

extension ForgotPasswordVM {
    
    func openAlert() {
        let alertVC = alertFactory.makeAlert(title: "Success", message: nil, actions: [.default("Okay", {
            self.coordinator?.finish(shouldMoveToParent: true)
        })])
        coordinator?.presentAlert(alertVC)
    }
    
}
