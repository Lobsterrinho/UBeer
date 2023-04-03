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
                          adapter: makeAdapter())
    }
    
    private static func makeAdapter() -> SettingsAdapterProtocol {
        return SettingsAdapter()
    }
    
}
