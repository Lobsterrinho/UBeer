//
//  CreateCheckInAssembler.swift
//  UBeer
//
//  Created by Lobster on 23.04.23.
//

import Foundation
import UIKit

final class CreateCheckInAssembler {
    
    private init() { }
    
    static func makeCheckInVC(
        coordinator: CreateCheckInCoordinatorProtocol,
        container: Container
    ) -> UIViewController {
        let viewModel = makeViewModel(coordinator: coordinator,
                                      container: container)
        return CreateCheckInVC(viewModel: viewModel)
    }
    
    private static func makeViewModel(
        coordinator: CreateCheckInCoordinatorProtocol,
        container: Container
    ) -> CreateCheckInVMProtocol {
        return CreateCheckInVM(
            coordinator: coordinator,
                            adapter: makeAdapter(),
            alertFactory: makeAlertFactory(container: container)
        )
    }
    
    private static func makeAdapter() -> CheckInAdapterProtocol {
        return CheckInAdapter()
    }
    
    private static func makeAlertFactory(
        container: Container
    ) -> AlertFactoryProtocol {
        return container.resolve()
    }
    
}
