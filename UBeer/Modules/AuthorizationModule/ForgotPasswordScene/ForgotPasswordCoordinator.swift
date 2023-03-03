//
//  ForgotPasswordCoordinator.swift
//  UBeer
//
//  Created by Lobster on 4.03.23.
//

import UIKit

final class ForgotPasswordCoordinator: Coordinator {
    
    private var navigationController: UINavigationController
    private var rootCoordinator: ForgotPasswordRootCoordinatorProtocol
    
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController,
         rootCoordinator: ForgotPasswordRootCoordinatorProtocol) {
        self.navigationController = navigationController
        self.rootCoordinator = rootCoordinator
    }
    
    func start() {
        let viewController = ForgotPasswordAssembler.makeViewController(self)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func finish() {
        navigationController.popViewController(animated: true)
        rootCoordinator.forgotPasswordFinished(self)
    }
    
    
}

extension ForgotPasswordCoordinator: ForgotPasswordCoordinatorProtocol {
    
}


