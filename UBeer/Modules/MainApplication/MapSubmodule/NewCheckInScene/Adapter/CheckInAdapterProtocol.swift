//
//  CheckInAdapterProtocol.swift
//  UBeer
//
//  Created by Lobster on 23.04.23.
//

import UIKit

protocol CheckInAdapterProtocol {
    
    var checkInModel: CheckInModel { get }
    func setupTableView(_ tableView: UITableView)
    func setupSections(_ sections: [CheckInSections])
    func setupSelectedImage(_ image: UIImage)
    func setupCreateCellVMDelegate(_ delegate: ButtonTableCellDelegate)
}
