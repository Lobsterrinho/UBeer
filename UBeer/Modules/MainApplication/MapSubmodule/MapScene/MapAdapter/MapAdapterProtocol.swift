//
//  MapAdapterProtocol.swift
//  UBeer
//
//  Created by Lobster on 5.04.23.
//

import UIKit
import MapKit

protocol MapAdapterProtocol {
    
    func setupMapView(_ mapView: MKMapView)
    func setupLocationManager(_ locationManager: CLLocationManager)
    func setupAdapterActionDelegate(_ delegate: MapAdapterActionDelegate)
    func checkIfAvailable() -> CLAuthorizationStatus
}
