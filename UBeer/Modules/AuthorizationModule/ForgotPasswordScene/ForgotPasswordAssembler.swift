//
//  ForgotPasswordAssembler.swift
//  UBeer
//
//  Created by Lobster on 4.03.23.
//

import UIKit

final class ForgotPasswordAssembler {
    
    private init() { }
    
    static func makeViewController(delegate: ForgotPasswordVMDelegate?,
                                   coordinator: ForgotPasswordCoordinatorProtocol,
                                   email: String?) -> UIViewController {
        
        let viewModel = makeViewModel(coordinator: coordinator,
                                      email: email,
                                      delegate: delegate)
        let viewController = ForgotPasswordVC(viewModel: viewModel)
        return viewController
    }
    
    private static func makeViewModel(coordinator: ForgotPasswordCoordinatorProtocol,
                                      email: String?,
                                      delegate: ForgotPasswordVMDelegate?) -> ForgotPasswordVMProtocol {
        
        let viewModel = ForgotPasswordVM(delegate: delegate,
                                         alertFactory: makeAlertFactory(),
                                         email: email,
                                         authorizationService: makeAuthorizationService(),
                                         coordinator: coordinator)
        return viewModel
    }
    
    private static func makeAuthorizationService() -> ForgotPasswordAuthorizationServiceProtocol {
        return AuthorizationService()
    }
    
    private static func makeAlertFactory() -> AlertControllerFactoryProtocol {
        return AlertControllerFactory()
    }
    
}
