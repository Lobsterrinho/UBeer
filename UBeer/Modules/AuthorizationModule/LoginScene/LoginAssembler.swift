//
//  LoginAssembler.swift
//  UBeer
//
//  Created by Lobster on 28.02.23.
//

import UIKit

final class LoginAssembler {
    
    private init() { }
    
    static func makeLoginVC(coordinator: LoginCoordinatorProtocol) -> UIViewController {
        let viewModel = makeViewModel(coordinator: coordinator)
        let viewController = LoginVC(viewModel: viewModel)
        return viewController
    }
    
    //MARK: - Helper
    
    private static func makeViewModel(coordinator: LoginCoordinatorProtocol) -> LoginVMProtocol {
        return LoginVM(authorizationService: makeAuthorizationService(),
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
