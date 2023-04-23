//
//  SettingsAdapterActionDelegate.swift
//  UBeer
//
//  Created by Lobster on 4.04.23.
//

import UIKit

protocol SettingsAdapterActionDelegate: AnyObject {
    func didSelectItem(settingsItem: SettingsItem, indexPath: IndexPath)
}
