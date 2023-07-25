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
    
    private weak var rootVC: UIViewController?
    
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
    //MARK: finish
    func finish(_ shouldDismiss: Bool) {
        if shouldDismiss {
            rootNavigationController.dismiss(animated: true)
        }
        finish()
    }
    
    //MARK: present alert
    func presentAlert(_ alert: UIAlertController) {
        rootVC?.present(alert, animated: true)
    }
    
    //MARK: present LottieAnimationVC
    func presentLottieAnimationAlert(with animationName: String) {
        let presentedAnimatedController = LottieAnimationAlertVC()
        presentedAnimatedController.modalPresentationStyle = .overFullScreen
        presentedAnimatedController.modalTransitionStyle = .crossDissolve
        presentedAnimatedController.setupLottieDelegate(self)
        presentedAnimatedController.setupLottieAnimationView(name: animationName)
        rootVC?.present(presentedAnimatedController, animated: true)
    }
    
#warning("make using of ImagePicker for previous iOS versions")
    func presentGalery(phPicker: PHPickerViewController,
                       imagePicker: UIImagePickerController) {
        if #available(iOS 15.0, *) {
            self.rootVC?.present(phPicker, animated: true)
        } else {
            self.rootVC?.present(imagePicker, animated: true)
        }
    }
//    private func presentPHPickerGalery(picker: PHPickerViewController) {
//
//    }
//
//    private func presentImagePickerGalery(picker: UIImagePickerController) {
//        let imagePickerController = UIImagePickerController()
//        imagePickerController.sourceType = .photoLibrary
//        self.rootVC?.present(imagePickerController, animated: true)
//    }
    
    func pickerDidCancel(_ picker: PHPickerViewController) {
        picker.dismiss(animated: true)
    }
    
    func presentCamera(imagePicker: UIImagePickerController) {
//        let imagePickerController = UIImagePickerController()
//        imagePickerController.sourceType = .camera
//        imagePickerController.allowsEditing = true
        rootVC?.present(imagePicker, animated: true)
    }
}

extension CreateCheckInCoordinator: LottieAnimationDelegate {
    func animationDidEnded() {
        finish(true)
    }
}
