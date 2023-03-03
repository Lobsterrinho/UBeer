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
    
    init(authorizationService: RegisterAuthorizationServiceProtocol,
         coordinator: RegisterCoordinatorProtocol) {
        self.authorizationService = authorizationService
        self.coordinator = coordinator
    }
    
    func register() {
        authorizationService.register()
        coordinator?.finish()
    }
    
}
