//
//  AppCoordinator.swift
//  UBeer
//
//  Created by Lobster on 28.02.23.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    private var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    private lazy var rootNavigationController: UINavigationController = {
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        return navigationController
    }()
    
    var childCoordinators = [Coordinator]()
    
    func start() {
        openLoginScene()
        window.makeKeyAndVisible()
    }
    
    func finish() {
        
    }
    
    
    private func openLoginScene() {
        let coordinator = LoginCoordinator(rootNavigationController: rootNavigationController, rootCoordinator: self)
        
        childCoordinators.append(coordinator)
        coordinator.start()
    }
    
}

extension AppCoordinator: LoginRootCoordinatorProtocol {
    
    func loginFinished(_ coordinator: Coordinator) {
        childCoordinators.removeAll(where: { $0 === coordinator })
        start()
    }
}
