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
    
    var childCoordinators: [Coordinator] = []
    
    init(tabBarController: UITabBarController,
         rootCoordinator: ProfileRootCoordinatorProtocol) {
        self.tabBarController = tabBarController
        self.rootCoordinator = rootCoordinator
    }
    
    func start() {
        let homeVC = ProfileAssembler.makeHomeVC(coordinator: self)
        tabBarController.addChild(homeVC)
    }
    
    func finish() {
        tabBarController.removeFromParent()
        rootCoordinator.homeSceneFinished(self)
    }
    
    
}

extension ProfileCoordinator: ProfileCoordinatorProtocol {
    
}
