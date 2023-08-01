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
        checkIn: CheckInModel?,
        myCoordinate: CLLocationCoordinate2D
    ) -> UIViewController {
        let viewModel = makeViewModel(coordinator: coordinator,
                                      checkIn: checkIn,
                                      myCoordinate: myCoordinate)
        return BottomSheetVC(viewModel: viewModel)
    }
    
    private static func makeViewModel(
        coordinator: BottomSheetCoordinatorProtocol,
        checkIn: CheckInModel?,
        myCoordinate: CLLocationCoordinate2D
    ) -> BottomSheetVMProtocol {
        return BottomSheetVM(coordinator: coordinator,
                             adapter: makeAdapter(),
                             checkIn: checkIn,
                             myCoordinate: myCoordinate)
    }
    
    private static func makeAdapter() -> BottomSheetAdapterProtocol {
        return BottomSheetAdapter()
    }
    
}
