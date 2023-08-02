//
//  BottomSheetAdapterProtocol.swift
//  UBeer
//
//  Created by Lobster on 22.04.23.
//

import Foundation
import UIKit
import CoreLocation

protocol BottomSheetAdapterProtocol {
    func setupTableView(_ tableView: UITableView)
    func setupCheckInValuesAndDistance(model: CheckInModel,
                                       distance: CLLocationDistance)
    func setupDelegate(_ delegate: BottomSheetHeaderDelegate)
    
}
