//
//  HomeAssembler.swift
//  UBeer
//
//  Created by Lobster on 23.03.23.
//

import UIKit

final class HomeAssembler {
    
    private init() {}
    
    static func makeHomeVC(coordinator: HomeCoordinatorProtocol) -> UIViewController {
        let viewModel = makeViewModel(coordinator: coordinator)
        return HomeVC(viewModel: viewModel)
    }
    
    static private func makeViewModel(coordinator: HomeCoordinatorProtocol) -> HomeVMProtocol {
        return HomeVM(coordinator: coordinator)
    }
    
}
