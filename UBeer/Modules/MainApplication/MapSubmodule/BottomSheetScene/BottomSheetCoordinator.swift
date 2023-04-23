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
    
    func start(pinCoordinate: CLLocationCoordinate2D,
               myCoordinate: CLLocationCoordinate2D) {
        let viewController = BottomSheetAssembler.makeBottomSheetVC(
            coordinator: self,
            pinCoordinate: pinCoordinate,
            myCoordinate: myCoordinate
        )
        setupBottomSheet(for: viewController)
        navigationController.present(viewController, animated: true)
    }
    
    func finish() {
        rootCoordinator.bottomSheetSceneDidFinished(self)
    }
    
    private func setupBottomSheet(for viewController: UIViewController) {

        if let sheet = viewController.sheetPresentationController {
            sheet.prefersGrabberVisible = true
            sheet.largestUndimmedDetentIdentifier = .some(UISheetPresentationController.Detent.Identifier(rawValue: "customMedium"))
            if #available(iOS 16.0, *) {
                sheet.detents = [
                    .custom(identifier: UISheetPresentationController.Detent.Identifier.init("customMedium"),
                            resolver: { context in
                                0.3 * context.maximumDetentValue
                            }),
                    .custom(resolver: { context in
                        49.0
                    }),
                    .large()
                ]
            } else {
                sheet.detents = [.medium(), .large()]
            }
        }
    }
    
    
}

extension BottomSheetCoordinator: BottomSheetCoordinatorProtocol {
    
    func shouldMoveToParent(_ shouldMove: Bool) {
        if shouldMove {
            navigationController.dismiss(animated: true)
        }
        finish()
    }
    
}
