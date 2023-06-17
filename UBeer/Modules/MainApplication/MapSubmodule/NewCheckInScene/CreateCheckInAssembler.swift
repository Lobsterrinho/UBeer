//
//  CreateCheckInAssembler.swift
//  UBeer
//
//  Created by Lobster on 23.04.23.
//

import Foundation
import UIKit
import CoreLocation

final class CreateCheckInAssembler {
    
    private init() { }
    
    static func makeCheckInVC(
        coordinator: CreateCheckInCoordinatorProtocol,
        container: Container,
        myCoordinate: CLLocationCoordinate2D
    ) -> UIViewController {
        let viewModel = makeViewModel(coordinator: coordinator,
                                      container: container,
                                      myCoordinate: myCoordinate)
        return CreateCheckInVC(viewModel: viewModel)
    }
    
    private static func makeViewModel(
        coordinator: CreateCheckInCoordinatorProtocol,
        container: Container,
        myCoordinate: CLLocationCoordinate2D
    ) -> CreateCheckInVMProtocol {
        return CreateCheckInVM(
            coordinator: coordinator,
            adapter: makeAdapter(),
            alertFactory: makeAlertFactory(container: container),
            realtimeDB: makeRealtimeDB(container: container),
            myCoordinate: myCoordinate
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
    
    private static func makeRealtimeDB(
        container: Container
    ) -> RealtimeDatabaseServiceProtocol {
        return container.resolve()
    }
    
}
