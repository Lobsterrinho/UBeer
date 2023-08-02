//
//  BottomSheetAssembler.swift
//  UBeer
//
//  Created by Lobster on 22.04.23.
//

import Foundation
import CoreLocation
import UIKit

final class BottomSheetAssembler {
 
    private init() { }
    
    static func makeBottomSheetVC(
        coordinator: BottomSheetCoordinatorProtocol,
        container: Container,
        checkIn: CheckInModel?,
        myCoordinate: CLLocationCoordinate2D
    ) -> UIViewController {
        let viewModel = makeViewModel(coordinator: coordinator,
                                      checkIn: checkIn,
                                      container: container,
                                      myCoordinate: myCoordinate)
        return BottomSheetVC(viewModel: viewModel)
    }
    
    private static func makeViewModel(
        coordinator: BottomSheetCoordinatorProtocol,
        checkIn: CheckInModel?,
        container: Container,
        myCoordinate: CLLocationCoordinate2D
    ) -> BottomSheetVMProtocol {
        return BottomSheetVM(coordinator: coordinator,
                             adapter: makeAdapter(),
                             imageDowloadService: makeImageDownloadService(container),
                             checkIn: checkIn,
                             myCoordinate: myCoordinate)
    }
    
    private static func makeAdapter() -> BottomSheetAdapterProtocol {
        return BottomSheetAdapter()
    }
    
    private static func makeImageDownloadService(_ container: Container) -> DIImageDownloadServiceProtocol {
        return container.resolve()
    }
    
}
