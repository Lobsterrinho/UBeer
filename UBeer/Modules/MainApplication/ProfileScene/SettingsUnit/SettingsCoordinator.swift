//
//  SettingsCoordinator.swift
//  UBeer
//
//  Created by Lobster on 1.04.23.
//

import UIKit

final class SettingsCoordinator: Coordinator {
    
    private var navigationController: UINavigationController
    private var rootCoordinator: SettingsRootCoordinatorProtocol
    
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController,
         rootCoordinator: SettingsRootCoordinatorProtocol) {
        self.navigationController = navigationController
        self.rootCoordinator = rootCoordinator
    }
    
    
    func start() {
        let rootViewController = SettingsAssembler.makeSettingsVC(self)
        navigationController.pushViewController(rootViewController, animated: true)
    }
    
    func finish() {
        rootCoordinator.settingsDidFinished(self)
    }
}

extension SettingsCoordinator: SettingsCoordinatorProtocol {
    
    func finish(_ shouldMovetoParentVC: Bool) {
        if shouldMovetoParentVC {
            navigationController.popViewController(animated: true)
        }
        finish()
    }
    
    func finishWithSighOut() {
        navigationController.popViewController(animated: false)
        rootCoordinator.settingsDidFinishedWithSignOut(self)
    }
    
    func presentAlert(_ alert: UIAlertController) {
        navigationController.present(alert, animated: true)
    }
}
