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
    
    private lazy var meLocation: MKPointAnnotation = {
        let pin = MKPointAnnotation()
        mapView?.addAnnotation(pin)
        return pin
    }()
    
    private var lastPin = MKPointAnnotation()
    
    func setupMapView(_ mapView: MKMapView) {
        self.mapView = mapView
        setupMapView()
    }
    
    private func setupMapView() {
        mapView?.delegate = self
        mapView?.showsCompass = false
        mapView?.showsScale = false
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
    
    private func addNewAnnotation() {
        
    }
    
    private func setupMapPin(_ coordinate: CLLocationCoordinate2D) {
        meLocation.coordinate = coordinate
    }
    
}

extension MapAdapter: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            locationManager?.stopUpdatingLocation()
            mapView?.removeAnnotation(lastPin)
            render(location)
        }
    }
}

extension MapAdapter: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView,
                 viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else { return nil }
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "customSelfLocationPin")
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation,
                                              reuseIdentifier: "customSelfLocationPin")
        } else {
            annotationView?.annotation = annotation
        }
        annotationView?.image = UIImage(named: "selfLocationPin")
        return annotationView
    }
    
    
}
