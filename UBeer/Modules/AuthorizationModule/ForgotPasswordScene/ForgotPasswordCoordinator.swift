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
        rootCoordinator.forgotPasswordFinished(self)
    }
    
    
}

extension ForgotPasswordCoordinator: ForgotPasswordCoordinatorProtocol {
    
    func finish(shouldMoveToParent: Bool) {
        if shouldMoveToParent {
            navigationController.popViewController(animated: true)
        }
        finish()
    }
    
}


