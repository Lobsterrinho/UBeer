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
    
    private weak var CheckInCellDelegate: ButtonTableCellDelegate?
    
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
#warning("delete magic number")
        tableView?.rowHeight = 48.0
    }
    
    func setupCreateCellVMDelegate(_ delegate: ButtonTableCellDelegate) {
        self.CheckInCellDelegate = delegate
    }
    
    private func registerCells() {
        
        tableView?.register(TextFieldCellPrototype.self,
                            forCellReuseIdentifier: "\(TextFieldCellPrototype.self)")
        
        tableView?.register(ButtonTableCellPrototype.self,
                            forCellReuseIdentifier: "\(ButtonTableCellPrototype.self)")
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
        
        let textFieldCell = tableView.dequeueReusableCell(
            withIdentifier: "\(TextFieldCellPrototype.self)",
            for: indexPath) as? TextFieldCellPrototype
        
        let buttonCell = tableView.dequeueReusableCell(
            withIdentifier: "\(ButtonTableCellPrototype.self)",
            for: indexPath) as? ButtonTableCellPrototype
        buttonCell?.setupCellDelegate(self)
        
        let section = sections[indexPath.section]
        
        switch section {
        case .photo:
            buttonCell?.setupButtonTitle(title: nil, imageName: "camera")
            return buttonCell ?? UITableViewCell()
        case .textField(let items):
            let item = items[indexPath.row]
            textFieldCell?.setup(item: item.placeholder)
            return textFieldCell ?? UITableViewCell()
        case .button:
            buttonCell?.setupButtonTitle(title: "Create check in", imageName: nil)
            return buttonCell ?? UITableViewCell()
        }
    }
}

extension CheckInAdapter: UITableViewDelegate {
    
    //    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    //        return 100.0
    //    }
}

extension CheckInAdapter: ButtonTableCellDelegate {
    
    func buttonDidTap(_ sender: UIButton) {
        CheckInCellDelegate?.buttonDidTap(sender)
    }
}
