//
//  OnboardingCoordinator.swift
//  UBeer
//
//  Created by Lobster on 18.03.23.
//

import Foundation
import UIKit

final class OnboardingCoordinator: Coordinator {
    
    private var rootNavigationController: UINavigationController
    private var rootCoordinator: OnboardingRootCoordinatorProtocol
    
    var childCoordinators: [Coordinator] = []
    
    init(rootNavigationController: UINavigationController,
         rootCoordinator: OnboardingRootCoordinatorProtocol) {
        self.rootNavigationController = rootNavigationController
        self.rootCoordinator = rootCoordinator
    }
    
    func start() {
        let rootViewController = OnboardingAssembler.makeOnboardingVC(coordinator: self)
        rootNavigationController.pushViewController(rootViewController, animated: true)
    }
    
    func finish() {
        
    }
}

extension OnboardingCoordinator: OnboardingCoordinatorProtocol {
    
}
