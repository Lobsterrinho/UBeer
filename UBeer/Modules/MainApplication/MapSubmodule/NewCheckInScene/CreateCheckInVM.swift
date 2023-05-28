//
//  CreateCheckInVM.swift
//  UBeer
//
//  Created by Lobster on 23.04.23.
//

import Foundation
import UIKit

final class CreateCheckInVM: CreateCheckInVMProtocol {
    
    private weak var coordinator: CreateCheckInCoordinatorProtocol?
    private var adapter: CheckInAdapterProtocol
    private var alertFactory: AlertControllerFactoryProtocol
    
    private let sections: [CheckInSections] = [
        .photo,
        .textField([CheckInItems(placeholder: "Number of people in company"),
                    CheckInItems(placeholder: "Wish something to all users")]),
        .button
    ]
    
    init(coordinator: CreateCheckInCoordinatorProtocol,
         adapter: CheckInAdapterProtocol,
         alertFactory: AlertControllerFactoryProtocol) {
        self.coordinator = coordinator
        self.adapter = adapter
        self.alertFactory = alertFactory
        adapter.setupCreateCellVMDelegate(self)
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
                                   self.coordinator?.presentGalery()
                               }),
                      .default("Take a photo",
                               {
                                   self.coordinator?.presentCamera()
                               }),
                      .cancel({ })]
        )
        coordinator?.presentAlert(actionSheet)
    }
    
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
    
}

extension CreateCheckInVM: ButtonTableCellDelegate {
    
    func buttonDidTap(_ sender: UIButton) {
        if sender.currentTitle != nil {
            presentDiscardAlert()
        } else {
            presentActionSheet()
        }
    }
}

