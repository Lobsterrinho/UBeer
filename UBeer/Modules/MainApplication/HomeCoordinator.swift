//
//  HomeCoordinator.swift
//  UBeer
//
//  Created by Lobster on 23.03.23.
//

import UIKit

final class HomeCoordinator: Coordinator {
    
    private var rootNavigationController: UINavigationController
    private var rootCoordinator: HomeRootCoordinatorProtocol
    
    var childCoordinators: [Coordinator] = []
    
    init(rootNavigationController: UINavigationController,
         rootCoordinator: HomeRootCoordinatorProtocol) {
        self.rootNavigationController = rootNavigationController
        self.rootCoordinator = rootCoordinator
    }
    
    func start() {
        let homeVC = HomeAssembler.makeHomeVC(coordinator: self)
        rootNavigationController.pushViewController(homeVC, animated: true)
    }
    
    func finish() {
        rootNavigationController.popViewController(animated: true)
        rootCoordinator.mainSceneFinished(self)
    }
    
    
}

extension HomeCoordinator: HomeCoordinatorProtocol {
    
}
