//
//  ForgotPasswordAssembler.swift
//  UBeer
//
//  Created by Lobster on 4.03.23.
//

import UIKit

final class ForgotPasswordAssembler {
    
    private init() { }
    
    static func makeViewController(coordinator: ForgotPasswordCoordinatorProtocol,
                                   container: Container,
                                   delegate: ForgotPasswordVMDelegate?,
                                   email: String?) -> UIViewController {
        
        let viewModel = makeViewModel(coordinator: coordinator,
                                      container: container,
                                      email: email,
                                      delegate: delegate)
        let viewController = ForgotPasswordVC(viewModel: viewModel)
        return viewController
    }
    
    private static func makeViewModel(
        coordinator: ForgotPasswordCoordinatorProtocol,
        container: Container,
        email: String?,
        delegate: ForgotPasswordVMDelegate?
    ) -> ForgotPasswordVMProtocol {
        
        let viewModel = ForgotPasswordVM(
            coordinator: coordinator,
            delegate: delegate,
            alertFactory: makeAlertFactory(container: container),
            email: email,
            authorizationService: makeAuthorizationService(container: container)
        )
        return viewModel
    }
    
    private static func makeAuthorizationService(
        container: Container
    ) -> AuthorizationServiceProtocol {
        return container.resolve()
    }
    
    private static func makeAlertFactory(
        container: Container
    ) -> AlertFactoryProtocol {
        return container.resolve()
    }
    
}
