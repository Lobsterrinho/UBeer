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
    private var container: Container
    
    var childCoordinators: [Coordinator] = []
    
    init(rootNavigationController: UINavigationController,
         rootCoordinator: TabBarRootCoordinatorProtocol,
         container: Container) {
        self.rootNavigationController = rootNavigationController
        self.rootCoordinator = rootCoordinator
        self.container = container
    }
    
    func start() {
        let tabBar = TabBarAssembler.makeTabBarController()
        rootNavigationController.navigationBar.isHidden = true
        
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
    
    private func generateMapItem(_ tabBar: UITabBarController) {
        let coordinator = MapCoordinator(tabBarController: tabBar,
                                         rootCoordinator: self,
                                         container: container)
        
        coordinator.start()
    }
    
    private func generateProfileItem(_ tabBar: UITabBarController) {
        let coordinator = ProfileCoordinator(tabBarController: tabBar,
                                             rootCoordinator: self)
        
        coordinator.start()
        
    }
    
}

extension TabBarCoordinator: BottomSheetRootCoordinatorProtocol {
    func bottomSheetSceneDidFinished(_ coordinator: Coordinator) { }
}

extension TabBarCoordinator: ProfileRootCoordinatorProtocol {
    
    func profileSceneFinished(_ coordinator: Coordinator) { }
}

extension TabBarCoordinator: MapRootCoordinatorProtocol {
    
    func mapSceneFinished(_ coordinator: Coordinator) { }
}

