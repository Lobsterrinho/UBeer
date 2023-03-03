//
//  RegisterCoordinator.swift
//  UBeer
//
//  Created by Lobster on 1.03.23.
//

import UIKit

final class RegisterCoordinator: Coordinator, RegisterCoordinatorProtocol {
    
    private var navigationController: UINavigationController
    private var rootCoordinator: RegisterRootCoordinatorProtocol
    
    var childCoordinators = [Coordinator]()
    
    init(navigationController: UINavigationController, rootCoordinator: RegisterRootCoordinatorProtocol, childCoordinators: [Coordinator] = [Coordinator]()) {
        self.navigationController = navigationController
        self.rootCoordinator = rootCoordinator
    }
    
    func start() {
        let viewController = RegisterAssembler.makeRegisterVC(coordinator: self)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func finish() {
        rootCoordinator.registerFinished(self)
        print("Registration finished")
        navigationController.popViewController(animated: true)
    }
    
}

extension RegisterAssembler: RegisterCoordinatorProtocol {
    
    func finish() {
        print("asdf")
    }
    
}
