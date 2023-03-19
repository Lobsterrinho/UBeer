//
//  RegisterVM.swift
//  UBeer
//
//  Created by Lobster on 1.03.23.
//

import UIKit

final class RegisterVM: RegisterVMProtocol {
    
    private var authorizationService: RegisterAuthorizationServiceProtocol
    private weak var coordinator: RegisterCoordinatorProtocol?
    private weak var delegate: RegisterVMDelegate?
    private var alertFactory: AlertControllerFactoryProtocol
    
    var email: String?
    
    init(alertFactory: AlertControllerFactoryProtocol,
         email: String?,
         authorizationService: RegisterAuthorizationServiceProtocol,
         coordinator: RegisterCoordinatorProtocol,
         delegate: RegisterVMDelegate?) {
        self.authorizationService = authorizationService
        self.coordinator = coordinator
        self.delegate = delegate
        self.email = email
        self.alertFactory = alertFactory
    }
    
    func register(email: String?, password: String?) {
        guard let email = email, !email.isEmpty && email != "",
              let password = password, !password.isEmpty && password != ""
        else {
            openAlert(title: "Сheck the entered data",
                      message: "Login and/or password can't be empty", shouldMovetoParentVC: false)
            return }
        authorizationService.register(email: email, password: password) { error in
            if error != nil {
                self.openAlert(title: "Something went wrong", message: error?.localizedDescription, shouldMovetoParentVC: false)
            } else {
                self.delegate?.RegisterFinished(with: email)
                self.openAlert(title: "Success", message: "You've succesfully signed up", shouldMovetoParentVC: true)
            }
        }
    }
    
    func finish(shouldMovetoParentVC: Bool) {
        coordinator?.finish(shouldMovetoParentVC: shouldMovetoParentVC)
    }
    
    
    
    private func openAlert(title: String?, message: String?, shouldMovetoParentVC: Bool) {
        let alert = alertFactory.makeAlert(title: title, message: message, actions: [.default("Okay", {
            if shouldMovetoParentVC {
                self.finish(shouldMovetoParentVC: true)
            }
        })])
        coordinator?.presentAlert(alert)
    }
    
}
