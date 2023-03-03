//
//  ForgotPasswordAssembler.swift
//  UBeer
//
//  Created by Lobster on 4.03.23.
//

import UIKit

final class ForgotPasswordAssembler {
    
    private init() { }
    
    static func makeViewController(_ coordinator: ForgotPasswordCoordinatorProtocol) -> UIViewController {
        let viewModel = makeViewModel(coordinator)
        let viewController = ForgotPasswordVC(viewModel: viewModel)
        return viewController
    }
    
    private static func makeViewModel(_ coordinator: ForgotPasswordCoordinatorProtocol) -> ForgotPasswordVMProtocol {
        let viewModel = ForgotPasswordVM(authorizationService: makeAuthorizationService(),
                                         coordinator: coordinator)
        return viewModel
    }
    
    private static func makeAuthorizationService() -> ForgotPasswordAuthorizationServiceProtocol {
        return AuthorizationService()
    }
    
}
