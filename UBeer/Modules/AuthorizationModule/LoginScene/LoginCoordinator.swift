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
    
    func openRegisterScene(delegate: RegisterViewModelDelegate, email: String?) {
        let registerCoordinator = RegisterCoordinator(
            navigationController: rootNavigationController,
            rootCoordinator: self)
        childCoordinators.append(registerCoordinator)
        registerCoordinator.start(delegate: delegate, email: email)
    }
    
    func openForgotPasswordScene(email: String?) {
        let forgotPasswordCoordinator = ForgotPasswordCoordinator(navigationController: rootNavigationController, rootCoordinator: self)
        childCoordinators.append(forgotPasswordCoordinator)
        forgotPasswordCoordinator.start(email: email)
    }
    
    
    
}

extension LoginCoordinator: RegisterViewModelDelegate {
    
    func RegisterFinished(with login: String) {
        print(login)
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
