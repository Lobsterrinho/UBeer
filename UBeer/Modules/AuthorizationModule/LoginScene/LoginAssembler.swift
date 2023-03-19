//
//  LoginAssembler.swift
//  UBeer
//
//  Created by Lobster on 28.02.23.
//

import UIKit

final class LoginAssembler {
    
    private init() { }
    
    static func makeLoginVC(coordinator: LoginCoordinatorProtocol, email: String) -> UIViewController {
        let viewModel = makeViewModel(coordinator: coordinator, email: email)
        let viewController = LoginVC(viewModel: viewModel)
        return viewController
    }
    
    //MARK: - Helper
    
    private static func makeViewModel(coordinator: LoginCoordinatorProtocol, email: String) -> LoginVMProtocol {
        return LoginVM(email: email, authorizationService: makeAuthorizationService(),
                       coordinator: coordinator,
                       alertFactory: makeAlertFactory())
    }
    
    private static func makeAuthorizationService() -> LoginAuthorizationServiceProtocol {
        return AuthorizationService()
    }
    
    private static func makeAlertFactory() -> AlertControllerFactoryProtocol {
        return AlertControllerFactory()
    }
    
}
