//
//  RegisterCoordinator.swift
//  UBeer
//
//  Created by Lobster on 1.03.23.
//

import UIKit

final class RegisterCoordinator: Coordinator {
    
    private var navigationController: UINavigationController
    private var rootCoordinator: RegisterRootCoordinatorProtocol
    
    var childCoordinators = [Coordinator]()
    
    init(navigationController: UINavigationController,
         rootCoordinator: RegisterRootCoordinatorProtocol) {
        self.navigationController = navigationController
        self.rootCoordinator = rootCoordinator
    }
    
    func start() {
        assert(false, "Should be open with login, please use start(delegate:)")
    }
    
    func start(delegate: RegisterViewModelDelegate?, email: String?) {
        let viewController = RegisterAssembler.makeRegisterVC(delegate: delegate,
                                                              coordinator: self,
                                                              email: email)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func finish() {
        rootCoordinator.registerFinished(self)
    }
    
    
    
}

extension RegisterCoordinator: RegisterCoordinatorProtocol {
    
    func finish(shouldMovetoParentVC: Bool) {
        if shouldMovetoParentVC {
            navigationController.popViewController(animated: true)
        }
        finish()
    }
    
}
