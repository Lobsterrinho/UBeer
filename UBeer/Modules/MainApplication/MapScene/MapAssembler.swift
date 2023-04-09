//
//  MapAssembler.swift
//  UBeer
//
//  Created by Lobster on 31.03.23.
//

import UIKit

final class MapAssembler {
    
    private init() { }
    
    static func makeMapVC(_ coordinator: MapCoordinatorProtocol) -> UIViewController {
        let viewModel = makeViewModel(coordinator)
        let viewController = MapVC(viewModel: viewModel)
//        viewController.hidesBottomBarWhenPushed = true
        return viewController
    }
    
    private static func makeViewModel(_ coordinator: MapCoordinatorProtocol) -> MapVMProtocol {
        return MapVM(coordinator: coordinator,
                     adapter: makeMapAdapter(),
                     alertFactory: makeAlertFactory())
    }
    
    private static func makeMapAdapter() -> MapAdapterProtocol {
        return MapAdapter()
    }
    
    private static func makeAlertFactory() -> AlertControllerFactoryProtocol {
        return AlertControllerFactory()
    }
}
