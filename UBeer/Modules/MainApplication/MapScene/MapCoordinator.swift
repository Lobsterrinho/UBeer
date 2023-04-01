//
//  MapCoordinator.swift
//  UBeer
//
//  Created by Lobster on 31.03.23.
//

import UIKit

final class MapCoordinator: Coordinator {
    
    private var tabBarController: UITabBarController
    private var rootCoordinator: MapRootCoordinatorProtocol
    
    var childCoordinators: [Coordinator] = []
    
    init(tabBarController: UITabBarController,
         rootCoordinator: MapRootCoordinatorProtocol) {
        self.tabBarController = tabBarController
        self.rootCoordinator = rootCoordinator
    }
    
    func start() {
        let mapVC = MapAssembler.makeMapVC(self)
        tabBarController.addChild(mapVC)
    }
    
    func finish() {
        tabBarController.removeFromParent()
        rootCoordinator.mapSceneFinished(self)
    }
}

extension MapCoordinator: MapCoordinatorProtocol { }
