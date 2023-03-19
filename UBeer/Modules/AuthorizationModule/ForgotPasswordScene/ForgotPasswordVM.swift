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
    
    func forgotPassword(email: String?) {
        guard let email = email, !email.isEmpty && email != ""
        else {
            openAlert(title: "Сheck the entered data",
                      message: "Login and/or password can't be empty", shouldMoveToParent: false)
            return }
        authorizationService.forgotPassword(email: email) { error in
            if error != nil {
                self.openAlert(title: "Something went wrong", message: error?.localizedDescription, shouldMoveToParent: false)
            } else {
                self.delegate?.passwordChanged(with: email)
                self.openAlert(title: "Success", message: "You've succesfully signed up", shouldMoveToParent: true)
            }
        }
    }
    
    func finish(shouldMoveToParent: Bool) {
        coordinator?.finish(shouldMoveToParent: shouldMoveToParent)
    }
    
}

extension ForgotPasswordVM {
    
    func openAlert(title: String?, message: String?, shouldMoveToParent: Bool) {
        let alertVC = alertFactory.makeAlert(title: title, message: message, actions: [.default("Okay", {
            if shouldMoveToParent {
                self.coordinator?.finish(shouldMoveToParent: true)
            }
        })])
        coordinator?.presentAlert(alertVC)
    }
    
}
