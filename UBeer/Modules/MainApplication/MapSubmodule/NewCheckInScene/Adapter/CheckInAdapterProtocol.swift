//
//  CheckInAdapterProtocol.swift
//  UBeer
//
//  Created by Lobster on 23.04.23.
//

import UIKit

protocol CheckInAdapterProtocol {
    
    func setupTableView(_ tableView: UITableView)
    func setupSections(_ sections: [CheckInSections])
    func setupCreateCellVMDelegate(_ delegate: ButtonTableCellDelegate)
}
