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
    func presentGalery(phPicker: PHPickerViewController, imagePicker: UIImagePickerController)
    func presentCamera(imagePicker: UIImagePickerController)
    func pickerDidCancel(_ picker: PHPickerViewController)
    func finish(_ shouldDismiss: Bool)
    func presentLottieAnimationAlert(with animationName: String)
}
