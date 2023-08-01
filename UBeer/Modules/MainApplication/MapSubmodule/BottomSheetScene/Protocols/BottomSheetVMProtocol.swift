//
//  BottomSheetVMProtocol.swift
//  UBeer
//
//  Created by Lobster on 22.04.23.
//

import UIKit

protocol BottomSheetVMProtocol {
    func setupTableView(_ tableView: UITableView)
    func shouldDismissVC(_ shouldDismiss: Bool)
}
