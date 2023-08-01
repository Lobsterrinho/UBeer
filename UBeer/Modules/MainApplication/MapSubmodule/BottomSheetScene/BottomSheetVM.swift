//
//  BottomSheetVM.swift
//  UBeer
//
//  Created by Lobster on 22.04.23.
//

import Foundation
import UIKit
import CoreLocation

final class BottomSheetVM: BottomSheetVMProtocol {
    
    private weak var coordinator: BottomSheetCoordinatorProtocol?
    private var adapter: BottomSheetAdapterProtocol
    
    private var myCoordinate: CLLocationCoordinate2D
    private var checkIn: CheckInModel?
    
    init(coordinator: BottomSheetCoordinatorProtocol,
         adapter: BottomSheetAdapterProtocol,
         checkIn: CheckInModel?,
         myCoordinate: CLLocationCoordinate2D) {
        self.coordinator = coordinator
        self.adapter = adapter
        self.checkIn = checkIn
        self.myCoordinate = myCoordinate
        adapter.setupDelegate(self)
    }
    
    private func calculateDistance() -> CLLocationDistance {
        guard let checkIn = checkIn else { return 0.0 }
        let myLocation = CLLocation(latitude: myCoordinate.latitude,
                                    longitude: myCoordinate.longitude)
        let selectedPinLocation = CLLocation(latitude: checkIn.latitude,
                                             longitude: checkIn.longitude)
        return myLocation.distance(from: selectedPinLocation)
        
    }
    
    func setupTableView(_ tableView: UITableView) {
        adapter.setupTableView(tableView)
        setupCheckInValues()
    }
    
    private func setupCheckInValues() {
        guard let checkIn = checkIn else { return }
        let checkInValues: [String] = [
            "checkIn.image",
            checkIn.numberOfPeople,
            checkIn.wishes
        ]
        adapter.setupCheckInValuesAndDistance(checkInValues,
                                              distance: calculateDistance())
    }

    func shouldDismissVC(_ shouldDismiss: Bool) {
        coordinator?.shouldDismissVC(shouldDismiss)
    }
}

extension BottomSheetVM: BottomSheetHeaderDelegate {
    
    func dismissButtonDidTap() {
        shouldDismissVC(true)
    }
}
