//
//  LoginCoordinator.swift
//  UBeer
//
//  Created by Lobster on 28.02.23.
//

import UIKit

final class LoginCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    
    private var rootNavigationController: UINavigationController
    private var rootCoordinator: LoginRootCoordinatorProtocol
    
    init(rootCoordinator: LoginRootCoordinatorProtocol,
         rootNavigationController: UINavigationController) {
        self.rootCoordinator = rootCoordinator
        self.rootNavigationController = rootNavigationController
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
    
    func openRegisterScene() {
        
    }
    
    func openForgotPasswordScene() {
        
    }
    
}
