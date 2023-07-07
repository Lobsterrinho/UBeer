//
//  CreateCheckInVM.swift
//  UBeer
//
//  Created by Lobster on 23.04.23.
//

import Foundation
import UIKit
import PhotosUI

final class CreateCheckInVM: CreateCheckInVMProtocol {
    
    private enum Consts {
        static let lottieAnimationName: String = "success"
    }
    
    private weak var coordinator: CreateCheckInCoordinatorProtocol?
    private var adapter: CheckInAdapterProtocol
    private var alertFactory: AlertControllerFactoryProtocol
    private var realtimeDB: CreateCheckInRealtimeDBServiceProtocol
    private var myCoordinate: CLLocationCoordinate2D
    
    
    
    private var phPicker: PHPickerViewController = {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        configuration.selectionLimit = 1
        let imagePicker = PHPickerViewController(configuration: configuration)
        return imagePicker
    }()
    
    private let sections: [CheckInSections] = [
        .photo,
        .textField([CheckInItems(placeholder: "Number of people in company"),
                    CheckInItems(placeholder: "Wish something to all users")]),
        .button
    ]
    
    init(coordinator: CreateCheckInCoordinatorProtocol,
         adapter: CheckInAdapterProtocol,
         alertFactory: AlertControllerFactoryProtocol,
    realtimeDB: CreateCheckInRealtimeDBServiceProtocol,
         myCoordinate: CLLocationCoordinate2D) {
        self.coordinator = coordinator
        self.adapter = adapter
        self.alertFactory = alertFactory
        self.realtimeDB = realtimeDB
        self.myCoordinate = myCoordinate
        adapter.setupCreateCellVMDelegate(self)
        phPicker.delegate = self
    }
    
    func setupTableView(_ tableView: UITableView) {
        adapter.setupTableView(tableView)
        setupSections()
    }
    
    private func setupSections() {
        adapter.setupSections(sections)
    }
    
    private func presentActionSheet() {
        let actionSheet = alertFactory.makeActionSheet(
            title: nil,
            message: nil,
            actions: [.default("Choose from galery",
                               {
                                   self.coordinator?.presentGalery(picker: self.phPicker)
                               }),
                      .default("Take a photo",
                               {
                                   self.coordinator?.presentCamera()
                               }),
                      .cancel({ })]
        )
        coordinator?.presentAlert(actionSheet)
    }
    
    #warning("don't present alert if fields are empty")
    func presentDiscardAlert() {
        let alert = alertFactory.makeAlert(
            title: nil,
            message: "Do you want to discard changes?",
            actions: [
                .cancel({ }),
                .destructive("Discard changes",
                             { self.coordinator?.finish(true) })
            ]
        )
        coordinator?.presentAlert(alert)
    }
    #warning("???is it right to take model and not receive her???")
    private func createCheckIn() {
        var checkInModel = adapter.checkInModel
        checkInModel.latitude = self.myCoordinate.latitude
        checkInModel.longitude = self.myCoordinate.longitude
        realtimeDB.createCheckIn(model: checkInModel)
    }
    
}

extension CreateCheckInVM: ButtonTableCellDelegate {
    
    func buttonDidTap(_ sender: UIButton) {
        if sender.currentTitle != nil {
//            createCheckIn()
            self.coordinator?.presentLottieAnimationAlert(with: Consts.lottieAnimationName)
        } else {
            presentActionSheet()
        }
    }
}

extension CreateCheckInVM: PHPickerViewControllerDelegate {
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        if results.isEmpty {
            self.coordinator?.pickerDidCancel(picker)
        }
        guard let result = results.first else { return }
        result.itemProvider
            .loadObject(ofClass: UIImage.self) { image, error in
                if let image = image as? UIImage {
                    DispatchQueue.main.async {
                        self.adapter.setupSelectedImage(image)
                    }
                }
            }
        self.coordinator?.pickerDidCancel(picker)
        
    }
}

