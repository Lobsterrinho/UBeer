//
//  CreateCheckInCoordinator.swift
//  UBeer
//
//  Created by Lobster on 23.04.23.
//

import Foundation
import UIKit
import PhotosUI
import CoreLocation

final class CreateCheckInCoordinator: Coordinator {
    
    private var rootNavigationController: UINavigationController
    private var rootCoordinator: CreateCheckInRootCoordinatorProtocol
    private var container: Container
    
    private var rootVC: UIViewController?
    
    var childCoordinators: [Coordinator] = []
    
    init(rootNavigationController: UINavigationController,
         rootCoordinator: CreateCheckInRootCoordinatorProtocol,
         container: Container) {
        self.rootNavigationController = rootNavigationController
        self.rootCoordinator = rootCoordinator
        self.container = container
    }
    
    func start() {
        assert(false, "Should be open with coordinates, please use start(myCoordinate: _)")
    }
    
    func start(myCoordinate: CLLocationCoordinate2D) {
        let viewController = CreateCheckInAssembler.makeCheckInVC(
            coordinator: self,
            container: container,
            myCoordinate: myCoordinate
        )
        rootVC = viewController
        viewController.modalPresentationStyle = .overFullScreen
        viewController.modalTransitionStyle = .crossDissolve
        rootNavigationController.present(viewController, animated: true)
    }
    
    func finish() {
        rootCoordinator.CreateCheckInSceneDidFinished(self)
    }
}

extension CreateCheckInCoordinator: CreateCheckInCoordinatorProtocol {
    
    func finish(_ shouldDismiss: Bool) {
        if shouldDismiss {
            rootNavigationController.dismiss(animated: true)
        }
        finish()
    }
    
    func presentAlert(_ alert: UIAlertController) {
        rootVC?.present(alert, animated: true)
    }
    
#warning("make using of ImagePicker for previous iOS versions")
    func presentGalery(picker: PHPickerViewController) {
        //        if #available(iOS 15.0, *) {
        
        self.rootVC?.present(picker, animated: true)
        //        } else {
        //            let imagePickerController = UIImagePickerController()
        //            imagePickerController.sourceType = .photoLibrary
        //            self.rootVC?.present(imagePickerController, animated: true)
        //        }
    }
    
    
    
    func pickerDidCancel(_ picker: PHPickerViewController) {
        picker.dismiss(animated: true)
    }
    
    func presentCamera() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .camera
        imagePickerController.allowsEditing = true
        rootVC?.present(imagePickerController, animated: true)
    }
}
