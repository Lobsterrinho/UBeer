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
    private var container: Container
    
    private var navigationController = UINavigationController()
    
    var childCoordinators: [Coordinator] = []
    
    init(tabBarController: UITabBarController,
         rootCoordinator: MapRootCoordinatorProtocol,
         container: Container) {
        self.tabBarController = tabBarController
        self.rootCoordinator = rootCoordinator
        self.container = container
    }
    
    func start() {
        let mapVC = MapAssembler.makeMapVC(coordinator: self,
                                           container: container)
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
    
    func openBottomSheet(checkIn: CheckInModel?,
                         myLocation: CLLocationCoordinate2D) {
        let bottomSheetCoordinator = BottomSheetCoordinator(
            navigationController: navigationController,
            rootCoordinator: self
        )
        childCoordinators.append(bottomSheetCoordinator)
        bottomSheetCoordinator.start(checkIn: checkIn,
                                     myCoordinate: myLocation)
    }
    
    func openNewCheckInScene(myCoordinate: CLLocationCoordinate2D) {
        let newCheckInCoordinator = CreateCheckInCoordinator(
            rootNavigationController: navigationController,
            rootCoordinator: self,
            container: container
        )
        childCoordinators.append(newCheckInCoordinator)
        newCheckInCoordinator.start(myCoordinate: myCoordinate)
    }
}

extension MapCoordinator: BottomSheetRootCoordinatorProtocol {
    func bottomSheetSceneDidFinished(_ coordinator: Coordinator) {
        childCoordinators.removeAll(where: { $0 === coordinator })
    }
}

extension MapCoordinator: CreateCheckInRootCoordinatorProtocol {
    func CreateCheckInSceneDidFinished(_ coordinator: Coordinator) {
        childCoordinators.removeAll(where: { $0 === coordinator })
    }
}
