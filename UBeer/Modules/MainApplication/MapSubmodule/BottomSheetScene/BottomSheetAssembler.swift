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
        pinCoordinate: CLLocationCoordinate2D,
        myCoordinate: CLLocationCoordinate2D
    ) -> UITableViewController {
        let viewModel = makeViewModel(coordinator: coordinator,
                                      pinCoordinate: pinCoordinate,
                                      myCoordinate: myCoordinate)
        return BottomSheetVC(viewModel: viewModel)
    }
    
    private static func makeViewModel(
        coordinator: BottomSheetCoordinatorProtocol,
        pinCoordinate: CLLocationCoordinate2D,
        myCoordinate: CLLocationCoordinate2D
    ) -> BottomSheetVMProtocol {
        return BottomSheetVM(coordinator: coordinator,
                             adapter: makeAdapter(),
                             pinCoordinate: pinCoordinate,
                             myCoordinate: myCoordinate)
    }
    
    private static func makeAdapter() -> BottomSheetAdapterProtocol {
        return BottomSheetAdapter()
    }
    
}
