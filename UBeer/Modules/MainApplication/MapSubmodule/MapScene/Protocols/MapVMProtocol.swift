//
//  MapVMProtocol.swift
//  UBeer
//
//  Created by Lobster on 31.03.23.
//

import UIKit
import MapKit

protocol MapVMProtocol {
    
    func setupMapView(_ mapView: MKMapView)
    func loadUsers()
    func addNewCheckIn()
    func getCurrentPosition()
}
