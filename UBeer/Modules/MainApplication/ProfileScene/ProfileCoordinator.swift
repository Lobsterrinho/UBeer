//
//  ProfileCoordinator.swift
//  UBeer
//
//  Created by Lobster on 23.03.23.
//

import UIKit

final class ProfileCoordinator: Coordinator {
    
    private var tabBarController: UITabBarController
    private var rootCoordinator: ProfileRootCoordinatorProtocol
    
    private var navigationController = UINavigationController()
    
    var childCoordinators: [Coordinator] = []
    
    init(tabBarController: UITabBarController,
         rootCoordinator: ProfileRootCoordinatorProtocol) {
        self.tabBarController = tabBarController
        self.rootCoordinator = rootCoordinator
    }
    
    func start() {
        let homeVC = ProfileAssembler.makeHomeVC(coordinator: self)
        navigationController.addChild(homeVC)
        tabBarController.addChild(navigationController)
    }
    
    func finish() {
        tabBarController.removeFromParent()
        rootCoordinator.homeSceneFinished(self)
    }
}

extension ProfileCoordinator: ProfileCoordinatorProtocol {
    
    func openSettingsScene() {
        let coordinator = SettingsCoordinator(navigationController: navigationController,
                                              rootCoordinator: self)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}

extension ProfileCoordinator: SettingsRootCoordinatorProtocol {
    func settingsDidFinished(_ coordinator: Coordinator) {
        childCoordinators.removeAll(where: { $0 === coordinator })
    }
}

