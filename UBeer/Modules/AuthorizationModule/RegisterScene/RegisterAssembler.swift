//
//  RegisterAssembler.swift
//  UBeer
//
//  Created by Lobster on 1.03.23.
//

import UIKit

final class RegisterAssembler {
    
    private init() { }
    
    static func makeRegisterVC(delegate: RegisterViewModelDelegate?,
                               coordinator: RegisterCoordinatorProtocol,
                               email: String?) -> UIViewController {
        let viewModel = makeViewModel(email: email, delegate: delegate, coordinator: coordinator)
        let viewController = RegisterVC(viewModel: viewModel, email: email)
        return viewController
    }
    
    private static func makeViewModel(email: String?,
                                      delegate: RegisterViewModelDelegate?,
                                      coordinator: RegisterCoordinatorProtocol) -> RegisterVMProtocol {
        let viewModel = RegisterVM(email: email,
                                   authorizationService: makeAuthorizationService(),
                                   coordinator: coordinator,
                                   delegate: delegate)
        return viewModel
    }
    
    private static func makeAuthorizationService() -> RegisterAuthorizationServiceProtocol {
        return AuthorizationService()
    }
    
}
