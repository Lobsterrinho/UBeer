//
//  RegisterAssembler.swift
//  UBeer
//
//  Created by Lobster on 1.03.23.
//

import UIKit

final class RegisterAssembler {
    
    static func makeRegisterVC(coordinator: RegisterCoordinatorProtocol) -> UIViewController {
        let viewModel = makeViewModel(coordinator)
        let viewController = RegisterVC(viewModel: viewModel)
        return viewController
    }
    
    private static func makeViewModel(_ coordinator: RegisterCoordinatorProtocol) -> RegisterVMProtocol {
        let viewModel = RegisterVM(authorizationService: makeAuthorizationService(),
                                   coordinator: coordinator)
        return viewModel
    }
    
    private static func makeAuthorizationService() -> RegisterAuthorizationServiceProtocol {
        return AuthorizationService()
    }
    
}
