//
//  SettingsAssembler.swift
//  UBeer
//
//  Created by Lobster on 1.04.23.
//

import UIKit

final class SettingsAssembler {
    
    private init() { }
    
    static func makeSettingsVC(_ coordinator: SettingsCoordinatorProtocol) -> UIViewController {
        let viewModel = makeViewModel(coordinator: coordinator)
        let vc = SettingsVC(viewModel: viewModel)
        vc.hidesBottomBarWhenPushed = true
        return vc
    }
    
    private static func makeViewModel(coordinator: SettingsCoordinatorProtocol) -> SettingsVMProtocol {
        return SettingsVM(coordinator: coordinator,
                          adapter: makeAdapter(),
                          authorizationService: makeAuthorizationService(),
                          alertFactory: makeAlertFactory())
    }
    
    private static func makeAdapter() -> SettingsAdapterProtocol {
        return SettingsAdapter()
    }
    
    private static func makeAuthorizationService() -> SettingsAuthorizationServiceProtocol {
        return AuthorizationService()
    }
    
    private static func makeAlertFactory() -> AlertControllerFactoryProtocol {
        return AlertControllerFactory()
    }
    
}
