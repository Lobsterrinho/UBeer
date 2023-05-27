//
//  LoginCoordinator.swift
//  UBeer
//
//  Created by Lobster on 28.02.23.
//

import UIKit

final class LoginCoordinator: Coordinator {
    
    private var rootNavigationController: UINavigationController
    private var rootCoordinator: LoginRootCoordinatorProtocol
    
    private var container: Container
    
    var childCoordinators: [Coordinator] = []
    
    init(rootNavigationController: UINavigationController,
         rootCoordinator: LoginRootCoordinatorProtocol,
         container: Container) {
        self.rootNavigationController = rootNavigationController
        self.rootCoordinator = rootCoordinator
        self.container = container
    }
    
    func start() {
        let rootViewController = LoginAssembler.makeLoginVC(coordinator: self,
                                                            container: container)
        rootNavigationController.pushViewController(rootViewController, animated: false)
    }
    
    func finish() {
        rootNavigationController.popViewController(animated: true)
        rootCoordinator.loginFinished(self)
    }
    
}

extension LoginCoordinator: LoginCoordinatorProtocol {
    
    func presentAlert(_ alert: UIViewController) {
        rootNavigationController.present(alert, animated: true)
    }
    
    func openRegisterScene(delegate: RegisterVMDelegate?,
                           email: String?) {
        let registerCoordinator = RegisterCoordinator(
            navigationController: rootNavigationController,
            rootCoordinator: self,
            container: container
        )
        childCoordinators.append(registerCoordinator)
        registerCoordinator.start(delegate: delegate,
                                  email: email)
    }
    
    func openForgotPasswordScene(delegate: ForgotPasswordVMDelegate?,
                                 email: String?) {
        let forgotPasswordCoordinator = ForgotPasswordCoordinator(
            navigationController: rootNavigationController,
            rootCoordinator: self,
            container: container
        )
        childCoordinators.append(forgotPasswordCoordinator)
        forgotPasswordCoordinator.start(delegate: delegate,
                                        email: email)
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
