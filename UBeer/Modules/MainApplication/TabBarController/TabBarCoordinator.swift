//
//  TabBarController.swift
//  UBeer
//
//  Created by Lobster on 31.03.23.
//

import UIKit

final class TabBarCoordinator: Coordinator {
    
    private var rootNavigationController: UINavigationController
    private var rootCoordinator: TabBarRootCoordinatorProtocol
    
    var childCoordinators: [Coordinator] = []
    
    init(rootNavigationController: UINavigationController,
         rootCoordinator: TabBarRootCoordinatorProtocol) {
        self.rootNavigationController = rootNavigationController
        self.rootCoordinator = rootCoordinator
    }
    
    func start() {
        let tabBar = TabBarAssembler.makeTabBarController()
        rootNavigationController.navigationBar.isHidden = true
        tabBar.hidesBottomBarWhenPushed = true
        
        generateMapItem(tabBar)
        generateProfileItem(tabBar)
        
        rootNavigationController.pushViewController(tabBar, animated: true)
    }
    
    func finish() {
        rootNavigationController.popViewController(animated: false)
        rootCoordinator.mainSceneFinished(self)
    }
}

extension TabBarCoordinator {
    
    private func generateProfileItem(_ tabBar: UITabBarController) {
        let coordinator = ProfileCoordinator(tabBarController: tabBar,
                                             rootCoordinator: self)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
    
    private func generateMapItem(_ tabBar: UITabBarController) {
        let coordinator = MapCoordinator(tabBarController: tabBar,
                                         rootCoordinator: self)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
    
}

extension TabBarCoordinator: ProfileRootCoordinatorProtocol {
    
    func profileSceneFinished(_ coordinator: Coordinator) { }
    
    func profileSceneFinishedWithSignOut(_ coordinator: Coordinator) {
        childCoordinators.removeAll(where: { $0 === coordinator })
        rootNavigationController.popViewController(animated: false)
        rootCoordinator.mainSceneFinishedWithSignOut(self)
    }
}

extension TabBarCoordinator: MapRootCoordinatorProtocol {
    
    func mapSceneFinished(_ coordinator: Coordinator) { }
}

