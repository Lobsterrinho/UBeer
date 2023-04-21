//
//  SettingsRootCoordinatorProtocol.swift
//  UBeer
//
//  Created by Lobster on 1.04.23.
//

import Foundation

protocol SettingsRootCoordinatorProtocol: AnyObject {
    func settingsDidFinished(_ coordinator: Coordinator)
    func settingsDidFinishedWithSignOut(_ coordinator: Coordinator)
}
