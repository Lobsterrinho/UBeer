//
//  MapAssembler.swift
//  UBeer
//
//  Created by Lobster on 31.03.23.
//

import UIKit

final class MapAssembler {
    
    private init() { }
    
    static func makeMapVC(_ coordinator: MapCoordinatorProtocol) -> UINavigationController {
        let viewModel = MapVM(coordinator: coordinator)
        let viewController = MapVC(viewModel: viewModel)
        return UINavigationController(rootViewController: viewController)
    }
    
    private static func makeViewModel(_ coordinator: MapCoordinatorProtocol) -> MapVMProtocol {
        return MapVM(coordinator: coordinator)
    }
}
