//
//  MapAssembler.swift
//  UBeer
//
//  Created by Lobster on 31.03.23.
//

import UIKit

final class MapAssembler {
    
    private init() { }
    
    static func makeMapVC(
        coordinator: MapCoordinatorProtocol,
        container: Container
    ) -> UIViewController {
        let viewModel = makeViewModel(coordinator: coordinator,
                                      container: container)
        let viewController = MapVC(viewModel: viewModel)
//        viewController.hidesBottomBarWhenPushed = true
        return viewController
    }
    
    private static func makeViewModel(coordinator: MapCoordinatorProtocol,
                                      container: Container) -> MapVMProtocol {
        return MapVM(coordinator: coordinator,
                     adapter: makeMapAdapter(),
                     alertFactory: makeAlertFactory(container: container),
                     realtimeDatabaseService: makeRealtimeDatabaseService(container: container))
    }
    
    private static func makeMapAdapter() -> MapAdapterProtocol {
        return MapAdapter()
    }
    
    private static func makeAlertFactory(container: Container) -> AlertFactoryProtocol {
        return container.resolve()
    }
    
    private static func makeRealtimeDatabaseService(
        container: Container
    ) -> RealtimeDatabaseServiceProtocol {
        return container.resolve()
    }
}
