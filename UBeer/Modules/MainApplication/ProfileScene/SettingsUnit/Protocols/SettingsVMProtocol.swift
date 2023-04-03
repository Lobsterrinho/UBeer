//
//  SettingsVMProtocol.swift
//  UBeer
//
//  Created by Lobster on 1.04.23.
//

import UIKit

protocol SettingsVMProtocol {
    
    func setupAdapter(with tableView: UITableView)
    func setupSections()
    func shouldMoveToParent(_ shouldMove: Bool)
}
