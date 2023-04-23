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
    
    private var pinCoordinate: CLLocationCoordinate2D
    private var myCoordinate: CLLocationCoordinate2D
    
    #warning("Change from hard data to data from pin")
    
    
    init(coordinator: BottomSheetCoordinatorProtocol,
         adapter: BottomSheetAdapterProtocol,
         pinCoordinate: CLLocationCoordinate2D,
         myCoordinate: CLLocationCoordinate2D) {
        self.coordinator = coordinator
        self.adapter = adapter
        self.pinCoordinate = pinCoordinate
        self.myCoordinate = myCoordinate
    }
    
    private func calculateDistance() -> CLLocationDistance {
        let myLocation = CLLocation(latitude: myCoordinate.latitude,
                                    longitude: myCoordinate.longitude)
        let selectedPinLocation = CLLocation(latitude: pinCoordinate.latitude,
                                             longitude: pinCoordinate.longitude)
        return myLocation.distance(from: selectedPinLocation)
        
    }
    
    func setupTableView(_ tableView: UITableView) {
        adapter.setupTableView(tableView)
        setupSections()
    }
    
    private func setupSections() {
        
        let sections: [BottomSheetSections] = [
            .distance(MapPinInfo(distance: Distance(distanceToPin: calculateDistance(),
                                                   image: UIImage(named: "beerMapIcon")!)))
                                 
        ]
        adapter.setupSections(sections)
    }
    
    func shouldMoveToParent(_ shouldMove: Bool) {
        coordinator?.shouldMoveToParent(shouldMove)
    }
    
}
