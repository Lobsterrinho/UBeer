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
        let profileVC = ProfileAssembler.makeProfileVC(coordinator: self)
        navigationController.addChild(profileVC)
        tabBarController.addChild(navigationController)
    }
    
    func finish() {
        tabBarController.removeFromParent()
        rootCoordinator.profileSceneFinished(self)
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

