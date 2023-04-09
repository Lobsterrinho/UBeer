//
//  MapAdapter.swift
//  UBeer
//
//  Created by Lobster on 5.04.23.
//

import UIKit
import Foundation
import CoreLocation
import MapKit

final class MapAdapter: NSObject, MapAdapterProtocol {
    
    private var mapView: MKMapView?
    private var locationManager: CLLocationManager?
    
    func setupMapView(_ mapView: MKMapView) {
        self.mapView = mapView
        
    }
    
    private func setupMapView() {
        
    }
    
    func setupLocationManager(_ locationManager: CLLocationManager) {
        self.locationManager = locationManager
        setupLocationManager()
    }
    
    private func setupLocationManager() {
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.startUpdatingLocation()
    }
    
    func checkIfAvailable() -> CLAuthorizationStatus {
        if let locationManager = self.locationManager {
            return locationManager.authorizationStatus
        }
        return .notDetermined
    }
    
    private func render(_ location: CLLocation) {
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude,
                                                longitude: location.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.004,
                                    longitudeDelta: 0.004)
        let region = MKCoordinateRegion(center: coordinate,
                                        span: span)
        mapView?.setRegion(region, animated: true)
        setupMapPin(coordinate)
    }
    
    private func setupMapPin(_ coordinate: CLLocationCoordinate2D) {
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        mapView?.addAnnotation(pin)
    }
    
}

extension MapAdapter: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            locationManager?.stopUpdatingLocation()
            render(location)
        }
    }
}
