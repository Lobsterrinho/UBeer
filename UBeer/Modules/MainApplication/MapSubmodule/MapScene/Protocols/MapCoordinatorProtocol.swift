//
//  MapCoordinatorProtocol.swift
//  UBeer
//
//  Created by Lobster on 31.03.23.
//

import UIKit
import CoreLocation

protocol MapCoordinatorProtocol: AnyObject {
    
    func presentAlert(_ alertController: UIAlertController)
    func finish()
    func openBottomSheet(pinCoordinate: CLLocationCoordinate2D,
                         myCoordinate: CLLocationCoordinate2D)
}
