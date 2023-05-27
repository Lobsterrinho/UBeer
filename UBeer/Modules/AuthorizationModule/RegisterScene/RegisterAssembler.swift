//
//  RegisterAssembler.swift
//  UBeer
//
//  Created by Lobster on 1.03.23.
//

import UIKit

final class RegisterAssembler {
    
    private init() { }
    
    static func makeRegisterVC(coordinator: RegisterCoordinatorProtocol,
                               container: Container,
                               delegate: RegisterVMDelegate?,
                               email: String?) -> UIViewController {
        let viewModel = makeViewModel(coordinator: coordinator,
                                      container: container,
                                      email: email,
                                      delegate: delegate)
        let viewController = RegisterVC(viewModel: viewModel)
        return viewController
    }
    
    private static func makeViewModel(
        coordinator: RegisterCoordinatorProtocol,
        container: Container,
        email: String?,
        delegate: RegisterVMDelegate?
    ) -> RegisterVMProtocol {
        let viewModel = RegisterVM(
            coordinator: coordinator,
            alertFactory: makeAlertFactory(container: container),
            email: email,
            authorizationService: makeAuthorizationService(container: container),
            delegate: delegate
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
