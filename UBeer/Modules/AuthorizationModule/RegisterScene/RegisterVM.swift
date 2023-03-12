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
    private weak var delegate: RegisterViewModelDelegate?
    
    private var email: String?
    
    init(email: String?,
         authorizationService: RegisterAuthorizationServiceProtocol,
         coordinator: RegisterCoordinatorProtocol,
         delegate: RegisterViewModelDelegate?) {
        self.authorizationService = authorizationService
        self.coordinator = coordinator
        self.delegate = delegate
        self.email = email
    }
    
    func register() {
        authorizationService.register()
        delegate?.RegisterFinished(with: "")
        
    }
    
    func finish(shouldMovetoParentVC: Bool) {
        coordinator?.finish(shouldMovetoParentVC: shouldMovetoParentVC)
    }
    
    func setupEmail(completion: (String?) -> Void) {
        completion(email)
    }
    
}
