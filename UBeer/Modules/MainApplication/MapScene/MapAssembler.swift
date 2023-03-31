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
        let viewModel = MapVM(coordinator: coordinator)
        return MapVC(viewModel: viewModel)
    }
    
    private static func makeViewModel(_ coordinator: MapCoordinatorProtocol) -> MapVMProtocol {
        return MapVM(coordinator: coordinator)
    }
    
}
