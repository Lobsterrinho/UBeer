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

protocol MapAdapterDelegate {
}

final class MapAdapter: NSObject, MapAdapterProtocol {
    
    private weak var mapView: MKMapView?
    private weak var locationManager: CLLocationManager?
    
    private var checkInsArray: [CheckInModel]?
    
    private weak var actionDelegate: MapAdapterActionDelegate?
    
    
    lazy var myLocation: MKPointAnnotation = {
        let pin = MKPointAnnotation()
        mapView?.addAnnotation(pin)
        return pin
    }()
    
    func setupMapView(_ mapView: MKMapView) {
        self.mapView = mapView
        setupMapView()
    }
    
    func setupUsersPins(_ checkInsArray: [CheckInModel]) {
        self.checkInsArray = checkInsArray
        setupUsersPins()
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
        locationManager?.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager?.requestWhenInUseAuthorization()
//        locationManager?.startUpdatingLocation()
    }
    
    func setupAdapterActionDelegate(_ delegate: MapAdapterActionDelegate) {
        self.actionDelegate = delegate
    }
    
    func checkIfAvailable() -> CLAuthorizationStatus {
        if let locationManager = self.locationManager {
            return locationManager.authorizationStatus
        }
        return .notDetermined
    }
    
    func centerMapOnUser() {
        locationManager?.startUpdatingLocation()
    }
    
    private func setupUsersPins() {
        var annotationsArray = [MKAnnotation]()
        checkInsArray?.forEach { element in
            let pointAnnitation = MKPointAnnotation()
            let coordinate = CLLocationCoordinate2D(latitude: element.latitude,
                                                    longitude: element.longitude)
            pointAnnitation.coordinate = coordinate
            
            annotationsArray.append(pointAnnitation)
        }
        mapView?.addAnnotations(annotationsArray)
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
        myLocation.coordinate = coordinate
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

extension MapAdapter: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView,
                 viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var selfAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "customSelfLocationPin")
        var checkInAnnotation = mapView.dequeueReusableAnnotationView(withIdentifier: "checkInPin")
        if annotation.coordinate.longitude == myLocation.coordinate.longitude && annotation.coordinate.latitude == myLocation.coordinate.latitude {
            selfAnnotationView = MKAnnotationView(annotation: annotation,
                                              reuseIdentifier: "customSelfLocationPin")
            selfAnnotationView?.image = UIImage(named: "selfLocationPin")
            return selfAnnotationView
        } else {
            checkInAnnotation = MKAnnotationView(annotation: annotation,
                                              reuseIdentifier: "checkInPin")
            checkInAnnotation?.image = UIImage(named: "userCheckInPin")
            return checkInAnnotation
        }
    }
    
    func mapView(_ mapView: MKMapView,
                 didSelect annotation: MKAnnotation) {
        let coordinate = annotation.coordinate
        actionDelegate?.didSelect(coordinate: coordinate,
                                  myLocation: myLocation.coordinate)
    }
    
    
}
