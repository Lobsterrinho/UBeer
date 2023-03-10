//
//  LoginCoordinator.swift
//  UBeer
//
//  Created by Lobster on 28.02.23.
//

import UIKit

final class LoginCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    private var rootNavigationController: UINavigationController
    private var rootCoordinator: LoginRootCoordinatorProtocol
    
    init(rootNavigationController: UINavigationController,
         rootCoordinator: LoginRootCoordinatorProtocol) {
        self.rootNavigationController = rootNavigationController
        self.rootCoordinator = rootCoordinator
    }
    
    func start() {
        let rootViewController = LoginAssembler.makeLoginVC(coordinator: self)
        rootNavigationController.pushViewController(rootViewController, animated: false)
    }
    
    func finish() {
        rootNavigationController.popViewController(animated: false)
        rootCoordinator.loginFinished(self)
    }
    
}

extension LoginCoordinator: LoginCoordinatorProtocol {
    
    func presentAlert(_ alert: UIViewController) {
        rootNavigationController.present(alert, animated: true)
    }
    
    func openRegisterScene() {
        let registerCoordinator = RegisterCoordinator(navigationController: rootNavigationController, rootCoordinator: self)
        childCoordinators.append(registerCoordinator)
        registerCoordinator.start()
    }
    
    func openForgotPasswordScene() {
        let forgotPasswordCoordinator = ForgotPasswordCoordinator(navigationController: rootNavigationController, rootCoordinator: self)
        childCoordinators.append(forgotPasswordCoordinator)
        forgotPasswordCoordinator.start()
    }
    
    
    
}

extension LoginCoordinator: RegisterRootCoordinatorProtocol {
    
    func registerFinished(_ coordinator: Coordinator) {
        childCoordinators.removeAll(where: { $0 === coordinator })
    }
}


extension LoginCoordinator: ForgotPasswordRootCoordinatorProtocol {
    
    func forgotPasswordFinished(_ coordinator: Coordinator) {
        childCoordinators.removeAll(where: { $0 === coordinator })
    }
    
    
}
