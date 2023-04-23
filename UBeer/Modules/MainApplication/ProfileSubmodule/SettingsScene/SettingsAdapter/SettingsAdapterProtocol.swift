//
//  SettingsAdapterProtocol.swift
//  UBeer
//
//  Created by Lobster on 2.04.23.
//

import UIKit

protocol SettingsAdapterProtocol {
    
    func setupTableView(tableView: UITableView)
    func setupSettingsAdapterActionDelegate(_ delegate: SettingsAdapterActionDelegate)
    func setupSections(_ sections: [SettingsSections])
}
