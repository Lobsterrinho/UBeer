//
//  MapPinInfo.swift
//  UBeer
//
//  Created by Lobster on 23.04.23.
//

import Foundation
import UIKit
import CoreLocation

struct MapPinInfo {
    let distance: Distance
}

struct Distance {
    let distanceToPin: CLLocationDistance
    let image: UIImage
}
