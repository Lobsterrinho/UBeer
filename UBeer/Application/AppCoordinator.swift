//
//  AppCoordinator.swift
//  UBeer
//
//  Created by Lobster on 28.02.23.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    private var windowScene: UIWindowScene
    private var window: UIWindow?
    
    var childCoordinators = [Coordinator]()
    
    init(windowScene: UIWindowScene) {
        self.windowScene = windowScene
    }
    
    func start() {
        let isRegistered = UserDefaults.standard.bool(forKey: "isRegistered")
        let shouldShowOnboarding = UserDefaults.standard.bool(forKey: "shouldShowOnboarding")
        if !isRegistered {
            openLoginScene()
        } else if shouldShowOnboarding {
            openOnboardingScene()
        } else {
            openMainScene()
        }
        window?.makeKeyAndVisible()
    }
    
    func finish() {
        
    }
    
    private func openLoginScene() {
        let loginWindow = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController()
        loginWindow.rootViewController = navigationController
        
        let coordinator = LoginCoordinator(rootNavigationController: navigationController,
                                           rootCoordinator: self)
        childCoordinators.append(coordinator)
        coordinator.start()
        
        window = loginWindow
    }
    
    private func openOnboardingScene() {
        let onboardingWindow = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController()
        onboardingWindow.rootViewController = navigationController
        
        let coordinator = OnboardingCoordinator(rootNavigationController: navigationController,
                                                rootCoordinator: self)
        childCoordinators.append(coordinator)
        coordinator.start()
        
        window = onboardingWindow
    }
    
    private func openMainScene() {
       
        
        
    }
}

extension AppCoordinator: LoginRootCoordinatorProtocol {
    
    func loginFinished(_ coordinator: Coordinator) {
        childCoordinators.removeAll(where: { $0 === coordinator })
        start()
    }
}

extension AppCoordinator: OnbordingRootCoordinatorProtocol {
    
    func onboardingFinished(_ coordinator: Coordinator) {
        childCoordinators.removeAll(where: { $0 === coordinator })
        start()
    }
}
