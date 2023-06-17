//
//  CreateCheckInCoordinatorProtocol.swift
//  UBeer
//
//  Created by Lobster on 23.04.23.
//

import Foundation
import UIKit
import PhotosUI

protocol CreateCheckInCoordinatorProtocol: AnyObject {
    
    func presentAlert(_ alert: UIAlertController)
    func presentGalery(picker: PHPickerViewController)
    func presentCamera()
    func pickerDidCancel(_ picker: PHPickerViewController)
    func finish(_ shouldDismiss: Bool)
}
