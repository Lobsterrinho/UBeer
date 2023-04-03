//
//  SettingsVM.swift
//  UBeer
//
//  Created by Lobster on 1.04.23.
//

import UIKit

final class SettingsVM: SettingsVMProtocol {
    
    private var coordinator: SettingsCoordinatorProtocol?
    private var adapter: SettingsAdapterProtocol
    
    private let sections: [Sections] = [
        .account([
            SettingsItem(title: "Main info",
                         image: UIImage(named: "settingsMainInfoIcon") ?? UIImage()),
            SettingsItem(title: "Location",
                         image: UIImage(named: "settingsLocationIcon") ?? UIImage())
        ]),
        .preferences([
            SettingsItem(title: "Theme",
                         image: UIImage(named: "settingsThemeIcon") ?? UIImage()),
            SettingsItem(title: "Language",
                         image: UIImage(named: "settingsLanguageIcon") ?? UIImage())
        ]),
        .links([
            SettingsItem(title: "GitHub",
                         image: UIImage(named: "settingsGitHubIcon") ?? UIImage()),
            SettingsItem(title: "Logout",
                         image: UIImage(named: "settingsLogoutIcon") ?? UIImage())
        ])
    ]
    
    init(coordinator: SettingsCoordinatorProtocol,
         adapter: SettingsAdapterProtocol) {
        self.coordinator = coordinator
        self.adapter = adapter
    }
    
    func setupSections() {
        adapter.setupSections(sections)
    }
    
    func shouldMoveToParent(_ shouldMove: Bool) {
        coordinator?.finish(shouldMove)
    }
    
    func setupAdapter(with tableView: UITableView) {
        adapter.setupTableView(tableView: tableView)
    }
    
}
