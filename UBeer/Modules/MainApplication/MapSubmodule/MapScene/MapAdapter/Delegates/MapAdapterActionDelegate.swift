//
//  MapAdapterActionDelegate.swift
//  UBeer
//
//  Created by Lobster on 22.04.23.
//

import UIKit
import CoreLocation

protocol MapAdapterActionDelegate: AnyObject {
    func didSelect(checkIn: CheckInModel?,
                   myLocation: CLLocationCoordinate2D)
}
