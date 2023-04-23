//
//  MapCoordinator.swift
//  UBeer
//
//  Created by Lobster on 31.03.23.
//

import UIKit
import CoreLocation

final class MapCoordinator: Coordinator {
    
    private var tabBarController: UITabBarController
    private var rootCoordinator: MapRootCoordinatorProtocol
    
    private var navigationController = UINavigationController()
    
    var childCoordinators: [Coordinator] = []
    
    init(tabBarController: UITabBarController,
         rootCoordinator: MapRootCoordinatorProtocol) {
        self.tabBarController = tabBarController
        self.rootCoordinator = rootCoordinator
    }
    
    func start() {
        let mapVC = MapAssembler.makeMapVC(self)
        navigationController.addChild(mapVC)
        tabBarController.addChild(navigationController)
    }
    
    func finish() {
        tabBarController.removeFromParent()
        rootCoordinator.mapSceneFinished(self)
    }
}

extension MapCoordinator: MapCoordinatorProtocol {
    
    func presentAlert(_ alertController: UIAlertController) {
        navigationController.present(alertController, animated: true)
    }
    
    func openBottomSheet(pinCoordinate: CLLocationCoordinate2D,
                         myCoordinate: CLLocationCoordinate2D) {
        let bottomSheetCoordinator = BottomSheetCoordinator(
            navigationController: navigationController,
            rootCoordinator: self
        )
        childCoordinators.append(bottomSheetCoordinator)
        bottomSheetCoordinator.start(pinCoordinate: pinCoordinate,
                                     myCoordinate: myCoordinate)
    }
}

extension MapCoordinator: BottomSheetRootCoordinatorProtocol {
    func bottomSheetSceneDidFinished(_ coordinator: Coordinator) {
        childCoordinators.removeAll(where: { $0 === coordinator })
    }
}
