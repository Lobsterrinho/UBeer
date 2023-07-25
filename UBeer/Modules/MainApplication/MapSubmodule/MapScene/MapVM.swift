//
//  MapVM.swift
//  UBeer
//
//  Created by Lobster on 31.03.23.
//

import UIKit
import MapKit
import CoreLocation

final class MapVM: MapVMProtocol {
    
    private var coordinator: MapCoordinatorProtocol
    private var adapter: MapAdapterProtocol
    private var alertFactory: AlertControllerFactoryProtocol
    private var realtimeDatabaseService: LoadCheckInsRealtimeDBServiceProtocol
    
    private var locationManager = CLLocationManager()
    
    init(coordinator: MapCoordinatorProtocol,
         adapter: MapAdapterProtocol,
         alertFactory: AlertControllerFactoryProtocol,
         realtimeDatabaseService: LoadCheckInsRealtimeDBServiceProtocol) {
        self.coordinator = coordinator
        self.adapter = adapter
        self.alertFactory = alertFactory
        self.realtimeDatabaseService = realtimeDatabaseService
        adapter.setupAdapterActionDelegate(self)
    }
    
    func loadCheckIns() {
        realtimeDatabaseService.loadCheckIns { usersCheckIns in
            print(usersCheckIns)
        }
    }
    
    func openAddNewCheckInScene() {
        coordinator.openNewCheckInScene(myCoordinate: adapter.myLocation.coordinate)
    }
    
    func setupMapView(_ mapView: MKMapView) {
        adapter.setupMapView(mapView)
    }
    
    func getCurrentPosition() {
        adapter.setupLocationManager(locationManager)
        switch adapter.checkIfAvailable() {
        case .denied: makeAlert()
        case .restricted: makeAlert()
        case .notDetermined: makeAlert()
        default: break
        }
    }
    
    private func makeAlert() {
        let alert = alertFactory.makeAlert(title: "Location Service is disabled",
                                           message: "Do you want enable location?",
                                           actions: [
                                            .cancel({ }),
                                            .default("Settings", {
                                                if let path = URL(string: UIApplication.openSettingsURLString) {
                                                    UIApplication.shared.open(path)
                                                }
                                            })
                                           ])
        self.coordinator.presentAlert(alert)
    }
}

extension MapVM: MapAdapterActionDelegate {
    
    func didSelect(coordinate: CLLocationCoordinate2D,
                   myLocation: CLLocationCoordinate2D) {
        coordinator.openBottomSheet(pinCoordinate: coordinate,
                                    myCoordinate: myLocation)
    }
}
