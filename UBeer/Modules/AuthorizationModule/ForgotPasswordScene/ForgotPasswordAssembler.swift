//
//  ForgotPasswordAssembler.swift
//  UBeer
//
//  Created by Lobster on 4.03.23.
//

import UIKit

final class ForgotPasswordAssembler {
    
    private init() { }
    
    static func makeViewController(coordinator: ForgotPasswordCoordinatorProtocol, email: String?) -> UIViewController {
        let viewModel = makeViewModel(coordinator: coordinator, email: email)
        let viewController = ForgotPasswordVC(viewModel: viewModel)
        return viewController
    }
    
    private static func makeViewModel(coordinator: ForgotPasswordCoordinatorProtocol, email: String?) -> ForgotPasswordVMProtocol {
        let viewModel = ForgotPasswordVM(email: email,
                                         authorizationService: makeAuthorizationService(),
                                         coordinator: coordinator)
        return viewModel
    }
    
    private static func makeAuthorizationService() -> ForgotPasswordAuthorizationServiceProtocol {
        return AuthorizationService()
    }
    
}
