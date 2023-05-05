//
//  CreateCheckInCoordinator.swift
//  UBeer
//
//  Created by Lobster on 23.04.23.
//

import Foundation
import UIKit
import PhotosUI

final class CreateCheckInCoordinator: Coordinator {
    
    private var rootNavigationController: UINavigationController
    private var rootCoordinator: CreateCheckInRootCoordinatorProtocol
    
    private var rootVC: UIViewController?
    
    var childCoordinators: [Coordinator] = []
    
    init(rootNavigationController: UINavigationController,
         rootCoordinator: CreateCheckInRootCoordinatorProtocol) {
        self.rootNavigationController = rootNavigationController
        self.rootCoordinator = rootCoordinator
    }
    
    func start() {
        let viewController = CreateCheckInAssembler.makeCheckInVC(coordinator: self)
        rootVC = viewController
        viewController.modalPresentationStyle = .overFullScreen
        viewController.modalTransitionStyle = .crossDissolve
        rootNavigationController.present(viewController, animated: true)
    }
    
    func finish() {
        rootNavigationController.dismiss(animated: true)
        rootCoordinator.CreateCheckInSceneDidFinished(self)
    }
}

extension CreateCheckInCoordinator: CreateCheckInCoordinatorProtocol {
    
    func presentAlert(_ alert: UIAlertController) {
        rootVC?.present(alert, animated: true)
    }
    
    func presentGalery() {
        if #available(iOS 15.0, *) {
            var configuration = PHPickerConfiguration()
            configuration.filter = .images
            configuration.selectionLimit = 1
            let imagePicker = PHPickerViewController(configuration: configuration)
            self.rootVC?.present(imagePicker, animated: true)
        } else {
            let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = .photoLibrary
            self.rootVC?.present(imagePickerController, animated: true)
        }
    }
    
    func presentCamera() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .camera
        imagePickerController.allowsEditing = true
        rootVC?.present(imagePickerController, animated: true)
    }
}
