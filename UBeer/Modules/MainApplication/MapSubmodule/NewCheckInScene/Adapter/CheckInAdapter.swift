//
//  CheckInAdapter.swift
//  UBeer
//
//  Created by Lobster on 23.04.23.
//

import Foundation
import UIKit

final class CheckInAdapter: NSObject, CheckInAdapterProtocol {
    
    private weak var tableView: UITableView?
    private var sections: [CheckInSections] = []
    
    private weak var createCellDelegate: ButtonTableCellDelegate?
    
    func setupTableView(_ tableView: UITableView) {
        self.tableView = tableView
        setupTableView()
    }
    
    func setupSections(_ sections: [CheckInSections]) {
        self.sections = sections
        reloadData()
    }
    
    private func reloadData() {
        tableView?.reloadData()
    }
    
    private func setupTableView() {
        registerCells()
        tableView?.delegate = self
        tableView?.dataSource = self
        
        tableView?.rowHeight = 48.0
    }
    
    func setupCreateCellVMDelegate(_ delegate: ButtonTableCellDelegate) {
        self.createCellDelegate = delegate
    }
    
    private func registerCells() {
        tableView?.register(AddPhotoTableCellPrototype.self,
                            forCellReuseIdentifier: "\(AddPhotoTableCellPrototype.self)")
        
        tableView?.register(CheckInTableCell.self,
                            forCellReuseIdentifier: "\(CheckInTableCell.self)")
        
        tableView?.register(CreateTableCellPrototype.self,
                            forCellReuseIdentifier: "\(CreateTableCellPrototype.self)")
    }
    
}

extension CheckInAdapter: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let photoCell = tableView.dequeueReusableCell(
            withIdentifier: "\(AddPhotoTableCellPrototype.self)",
            for: indexPath) as? AddPhotoTableCellPrototype
        
        let textFieldCell = tableView.dequeueReusableCell(
            withIdentifier: "\(CheckInTableCell.self)",
            for: indexPath) as? CheckInTableCell
        
        let checkInCell = tableView.dequeueReusableCell(
            withIdentifier: "\(CreateTableCellPrototype.self)",
            for: indexPath) as? CreateTableCellPrototype
        
        let section = sections[indexPath.section]
        
        switch section {
        case .photo:
            photoCell?.viewModel = AddPhotoTableCellVMAssembler.makeViewModel()
            return photoCell ?? UITableViewCell()
        case .textField(let items):
            let item = items[indexPath.row]
            textFieldCell?.setup(item: item.placeholder)
            return textFieldCell ?? UITableViewCell()
        case .button:
            checkInCell?.setupCellDelegate(self)
            return checkInCell ?? UITableViewCell()
        }
    }
}

extension CheckInAdapter: UITableViewDelegate {
    
    //    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    //        return 100.0
    //    }
}

extension CheckInAdapter: ButtonTableCellDelegate {
    
    func buttonDidTap() {
        createCellDelegate?.buttonDidTap()
    }
}
