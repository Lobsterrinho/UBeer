//
//  BottomSheetCoordinator.swift
//  UBeer
//
//  Created by Lobster on 22.04.23.
//

import Foundation
import UIKit
import CoreLocation

final class BottomSheetCoordinator: Coordinator {
    
    private var navigationController: UINavigationController
    private var rootCoordinator: BottomSheetRootCoordinatorProtocol
    
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController,
         rootCoordinator: BottomSheetRootCoordinatorProtocol) {
        self.navigationController = navigationController
        self.rootCoordinator = rootCoordinator
    }
    
    func start() {
        assert(false, "Should be open with coordinates, please use start(pinCoordinate: _, myCoordinate: _)")
    }
    
    func start(checkIn: CheckInModel?,
               myCoordinate: CLLocationCoordinate2D) {
        let viewController = BottomSheetAssembler.makeBottomSheetVC(
            coordinator: self,
            checkIn: checkIn,
            myCoordinate: myCoordinate
        )
        if let sheet = viewController.sheetPresentationController {
            sheet.prefersGrabberVisible = true
            sheet.detents = [.medium(), .large()]
        }
        navigationController.present(viewController, animated: true)
    }
    
    func finish() {
        rootCoordinator.bottomSheetSceneDidFinished(self)
    }
    
}

extension BottomSheetCoordinator: BottomSheetCoordinatorProtocol {
    
    func shouldDismissVC(_ shoulDismiss: Bool) {
        if shoulDismiss {
            navigationController.dismiss(animated: true)
        }
        finish()
    }
    
}
