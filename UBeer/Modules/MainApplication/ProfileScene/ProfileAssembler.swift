//
//  HomeAssembler.swift
//  UBeer
//
//  Created by Lobster on 23.03.23.
//

import UIKit

final class ProfileAssembler {
    
    private init() {}
    
    static func makeHomeVC(coordinator: ProfileCoordinatorProtocol) -> UINavigationController {
        let viewModel = makeViewModel(coordinator: coordinator)
        let viewController = ProfileVC(viewModel: viewModel)
        return UINavigationController(rootViewController: viewController)
    }
    
    static private func makeViewModel(coordinator: ProfileCoordinatorProtocol) -> ProfileVMProtocol {
        return ProfileVM(coordinator: coordinator)
    }
    
}
