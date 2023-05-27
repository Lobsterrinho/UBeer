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
    private var container: Container
    
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController,
         rootCoordinator: ForgotPasswordRootCoordinatorProtocol,
         container: Container) {
        self.navigationController = navigationController
        self.rootCoordinator = rootCoordinator
        self.container = container
    }
    
    func start() {
        assert(false, "Should be open with login, please use start(delegate:)")
    }
    
    func start(
        delegate: ForgotPasswordVMDelegate?,
        email: String?
    ) {
        
        let viewController = ForgotPasswordAssembler.makeViewController(
            coordinator: self,
            container: container,
            delegate: delegate,
            email: email
        )
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func finish() {
        rootCoordinator.forgotPasswordFinished(self)
    }
    
}

extension ForgotPasswordCoordinator {
    
    func presentAlert(_ alert: UIAlertController) {
        navigationController.present(alert, animated: true)
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


