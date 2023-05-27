//
//  LoginAssembler.swift
//  UBeer
//
//  Created by Lobster on 28.02.23.
//

import UIKit

final class LoginAssembler {
    
    private init() { }
    
    static func makeLoginVC(
        coordinator: LoginCoordinatorProtocol,
        container: Container) -> UIViewController {
            let viewModel = makeViewModel(coordinator: coordinator,
                                          container: container)
        let viewController = LoginVC(viewModel: viewModel)
        return viewController
    }
    
    //MARK: - Helper
    
    private static func makeViewModel(
        coordinator: LoginCoordinatorProtocol,
        container: Container) -> LoginVMProtocol {
        return LoginVM(coordinator: coordinator,
                       authorizationService: makeAuthorizationService(container: container),
                       alertFactory: makeAlertFactory(container: container))
    }
    
    private static func makeAuthorizationService(container: Container) -> AuthorizationServiceProtocol {
        return container.resolve()
    }
    
    private static func makeAlertFactory(container: Container) -> AlertFactoryProtocol {
        return container.resolve()
    }
    
}
