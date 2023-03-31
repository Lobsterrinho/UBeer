//
//  HomeAssembler.swift
//  UBeer
//
//  Created by Lobster on 23.03.23.
//

import UIKit

final class ProfileAssembler {
    
    private init() {}
    
    static func makeHomeVC(coordinator: ProfileCoordinatorProtocol) -> UIViewController {
        let viewModel = makeViewModel(coordinator: coordinator)
        return ProfileVC(viewModel: viewModel)
    }
    
    static private func makeViewModel(coordinator: ProfileCoordinatorProtocol) -> ProfileVMProtocol {
        return ProfileVM(coordinator: coordinator)
    }
    
}
