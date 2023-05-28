//
//  CreateCheckInCoordinatorProtocol.swift
//  UBeer
//
//  Created by Lobster on 23.04.23.
//

import Foundation
import UIKit

protocol CreateCheckInCoordinatorProtocol: AnyObject {
    
    func presentAlert(_ alert: UIAlertController)
    func presentGalery()
    func presentCamera()
    func finish(_ shouldDismiss: Bool)
}
