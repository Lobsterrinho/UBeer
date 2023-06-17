//
//  CheckInAdapter.swift
//  UBeer
//
//  Created by Lobster on 23.04.23.
//

import Foundation
import UIKit

final class CheckInAdapter: NSObject, CheckInAdapterProtocol {
    
    private enum Const {
        static var numberOfPeople: String = ""
    }
    
    private weak var tableView: UITableView?
    private var selectedImage: UIImage?
    private var sections: [CheckInSections] = []
    
    private var shouldAccept: Bool = false
    lazy var checkInModel = CheckInModel(longitude: 0.0,
                                            latitude: 0.0,
                                            numberOfPeople: "",
                                            wishes: "") {
        didSet {
            if !checkInModel.wishes.isEmpty && !checkInModel.numberOfPeople.isEmpty {
                shouldAccept = true
            } else {
                shouldAccept = false
            }
            let indexPath = IndexPath(row: 0, section: 2)
            reloadRows(at: indexPath, with: .none)
        }
    }
    
    private weak var CheckInCellDelegate: ButtonTableCellDelegate?
    
    func setupTableView(_ tableView: UITableView) {
        self.tableView = tableView
        setupTableView()
    }
    
    func setupSections(_ sections: [CheckInSections]) {
        self.sections = sections
        reloadData()
    }
    
    func setupSelectedImage(_ image: UIImage) {
        self.selectedImage = image
        let firstCellIndex = sections.startIndex
        let indexPath = IndexPath(row: firstCellIndex, section: firstCellIndex)
        reloadRows(at: indexPath, with: .fade)
    }
    
    private func reloadData() {
        tableView?.reloadData()
    }
    
    private func reloadRows(at indexPath: IndexPath, with animation: UITableView.RowAnimation ) {
        tableView?.reloadRows(at: [indexPath], with: animation)
    }
    
    private func setupTableView() {
        registerCells()
        tableView?.delegate = self
        tableView?.dataSource = self
    }
    
    func setupCreateCellVMDelegate(_ delegate: ButtonTableCellDelegate) {
        self.CheckInCellDelegate = delegate
    }
    
    private func registerCells() {
        
        tableView?.register(TextFieldCellPrototype.self,
                            forCellReuseIdentifier: "\(TextFieldCellPrototype.self)")
        
        tableView?.register(ButtonTableCellPrototype.self,
                            forCellReuseIdentifier: "\(ButtonTableCellPrototype.self)")
        
        tableView?.register(PhotoTableCellPrototype.self,
                            forCellReuseIdentifier: "\(PhotoTableCellPrototype.self)")
    }
}

extension CheckInAdapter: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return sections[section].rowCount
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let textFieldCell = tableView.dequeueReusableCell(
            withIdentifier: "\(TextFieldCellPrototype.self)",
            for: indexPath) as? TextFieldCellPrototype
        textFieldCell?.setupTextDelegate(self)
        
        let buttonCell = tableView.dequeueReusableCell(
            withIdentifier: "\(ButtonTableCellPrototype.self)",
            for: indexPath) as? ButtonTableCellPrototype
        buttonCell?.setupCellDelegate(self)
        buttonCell?.acceptCheckIn = self.shouldAccept
        
        let photoButton = tableView.dequeueReusableCell(
            withIdentifier: "\(PhotoTableCellPrototype.self)",
            for: indexPath) as? PhotoTableCellPrototype
        photoButton?.setupCellDelegate(self)
        photoButton?.setupCellDeleteDelegate(self)
        
        let section = sections[indexPath.section]
        
        switch section {
        case .photo:
            tableView.allowsSelection = false
            photoButton?.setupButtonImage(imageName: "camera")
            if selectedImage != nil {
                photoButton?.setupSelectedImage(image: selectedImage)
            }
            return photoButton ?? UITableViewCell()
        case .textField(let items):
            let item = items[indexPath.row]
            textFieldCell?.setup(item: item.placeholder)
            textFieldCell?.receiveIndexPath(indexPath)
            return textFieldCell ?? UITableViewCell()
        case .button:
            buttonCell?.setupButtonTitle(title: "Create check in", imageName: nil)
            return buttonCell ?? UITableViewCell()
        }
    }
}

extension CheckInAdapter: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension CheckInAdapter: ButtonTableCellDelegate {
    
    func buttonDidTap(_ sender: UIButton) {
        CheckInCellDelegate?.buttonDidTap(sender)
    }
}

extension CheckInAdapter: DeleteButtonTableCellDelegate {
    
    func deleteButtonDidTap() {
        selectedImage = nil
        let firstCellIndex = sections.startIndex
        let indexPath = IndexPath(row: firstCellIndex, section: firstCellIndex)
        tableView?.reloadRows(at: [indexPath], with: .fade)
    }
}

extension CheckInAdapter: TextFieldTextDelegate {
    
    func textFromTextField(text: String, indexPath: IndexPath) {
        switch indexPath {
        case [1, 0]: checkInModel.numberOfPeople = text
        case [1, 1]: checkInModel.wishes = text
        default: break
        }
    }
}
