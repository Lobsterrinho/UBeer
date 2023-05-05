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
        coordinator: CreateCheckInCoordinatorProtocol
    ) -> UIViewController {
        let viewModel = makeViewModel(coordinator: coordinator)
        return CreateCheckInVC(viewModel: viewModel)
    }
    
    private static func makeViewModel(
        coordinator: CreateCheckInCoordinatorProtocol
    ) -> CreateCheckInVMProtocol {
        return CreateCheckInVM(coordinator: coordinator,
                            adapter: makeAdapter(),
                            alertFactory: makeAlertFactory())
    }
    
    private static func makeAdapter() -> CheckInAdapterProtocol {
        return CheckInAdapter()
    }
    
    private static func makeAlertFactory() -> AlertControllerFactoryProtocol {
        return AlertControllerFactory()
    }
    
}
