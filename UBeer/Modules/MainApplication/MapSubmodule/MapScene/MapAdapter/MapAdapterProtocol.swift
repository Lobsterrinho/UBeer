//
//  MapAdapterProtocol.swift
//  UBeer
//
//  Created by Lobster on 5.04.23.
//

import UIKit
import MapKit
import CoreLocation

protocol MapAdapterProtocol {
    
    var myLocation: MKPointAnnotation { get }
    func setupMapView(_ mapView: MKMapView)
    func setupUsersPins(_ checkInsArray: [CheckInModel])
    func setupLocationManager(_ locationManager: CLLocationManager)
    func setupAdapterActionDelegate(_ delegate: MapAdapterActionDelegate)
    func checkIfAvailable() -> CLAuthorizationStatus
}
