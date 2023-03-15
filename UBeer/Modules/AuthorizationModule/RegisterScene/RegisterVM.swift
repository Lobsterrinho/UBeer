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
    
    func register(email: String) {
        authorizationService.register()
        delegate?.RegisterFinished(with: email)
        openAlert()
        
    }
    
    func finish(shouldMovetoParentVC: Bool) {
        coordinator?.finish(shouldMovetoParentVC: shouldMovetoParentVC)
    }
    
    
    
    private func openAlert() {
        let successAlert = alertFactory.makeAlert(title: "Success",
                                                  message: nil,
                                                  actions: [.default(
                                                    "Okay", {
                                                        self.finish(shouldMovetoParentVC: true)
                                                    })])
        coordinator?.presentAlert(successAlert)
    }
    
}
