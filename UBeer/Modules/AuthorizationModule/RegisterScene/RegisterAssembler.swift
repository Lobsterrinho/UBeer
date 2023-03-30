//
//  RegisterAssembler.swift
//  UBeer
//
//  Created by Lobster on 1.03.23.
//

import UIKit

final class RegisterAssembler {
    
    private init() { }
    
    static func makeRegisterVC(delegate: RegisterVMDelegate?,
                               coordinator: RegisterCoordinatorProtocol,
                               email: String?) -> UIViewController {
        let viewModel = makeViewModel(email: email,
                                      delegate: delegate,
                                      coordinator: coordinator)
        let viewController = RegisterVC(viewModel: viewModel)
        return viewController
    }
    
    private static func makeViewModel(email: String?,
                                      delegate: RegisterVMDelegate?,
                                      coordinator: RegisterCoordinatorProtocol) -> RegisterVMProtocol {
        let viewModel = RegisterVM(alertFactory: makeAlertFactory(),
                                   email: email,
                                   authorizationService: makeAuthorizationService(),
                                   coordinator: coordinator,
                                   delegate: delegate)
        return viewModel
    }
    
    private static func makeAuthorizationService() -> RegisterAuthorizationServiceProtocol {
        return AuthorizationService()
    }
    
    private static func makeAlertFactory() -> AlertControllerFactoryProtocol {
        return AlertControllerFactory()
    }
    
}
