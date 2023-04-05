//
//  SettingsVM.swift
//  UBeer
//
//  Created by Lobster on 1.04.23.
//

import UIKit

final class SettingsVM: SettingsVMProtocol {
    
    private weak var coordinator: SettingsCoordinatorProtocol?
    private var adapter: SettingsAdapterProtocol
    private var authorizationService: SettingsAuthorizationServiceProtocol
    private var alertFactory: AlertControllerFactoryProtocol
    
    
    private let sections: [SettingsSections] = [
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
         adapter: SettingsAdapterProtocol,
         authorizationService: SettingsAuthorizationServiceProtocol,
         alertFactory: AlertControllerFactoryProtocol) {
        self.coordinator = coordinator
        self.adapter = adapter
        self.authorizationService = authorizationService
        self.alertFactory = alertFactory
        self.adapter.setupSettingsAdapterActionDelegate(self)
    }
    
    func shouldMoveToParent(_ shouldMove: Bool) {
        coordinator?.finish(shouldMove)
    }
    
    func setupAdapter(with tableView: UITableView) {
        adapter.setupTableView(tableView: tableView)
        setupSections()
    }
    
    private func setupSections() {
        adapter.setupSections(sections)
    }
    
    private func signOut() {
        self.showAlert(title: "Sign out",
                       message: "Are you sure you want to sign out?")
    }
    
}

extension SettingsVM {
    
    private func showAlert(title: String?,
                           message: String?) {
        let alert = alertFactory.makeAlert(
            title: title,
            message: message,
            actions: [.default("Yes", {
                                   self.authorizationService.signOut { error in
                                       self.showUnsucessfullAlert(
                                        title: "Something went wrong",
                                        message: error?.localizedDescription)
                                   }
//                self.coordinator?.finish(true)
                /*let ud = UserDefaults.standard
                ud.set(false, forKey: "isRegistered")
                               */}),
                      .cancel({ })
            ]
        )
        self.coordinator?.presentAlert(alert)
    }
    
    private func showUnsucessfullAlert(title: String?,
                                       message: String? ) {
        let alert = alertFactory.makeAlert(
            title: title,
            message: message,
            actions: [.cancel({ })]
        )
        self.coordinator?.presentAlert(alert)
    }
    
}

extension SettingsVM: SettingsAdapterActionDelegate {
    
    func didSelectItem(settingsItem: SettingsItem, indexPath: IndexPath) {
        switch indexPath {
        case [0, 0]: print("\(settingsItem.title) \(indexPath)")
        case [0, 1]: print("\(settingsItem.title) \(indexPath)")
        case [1, 0]: print("\(settingsItem.title) \(indexPath)")
        case [1, 1]: print("\(settingsItem.title) \(indexPath)")
        case [2, 0]: print("\(settingsItem.title) \(indexPath)")
        case [2, 1]: signOut()
        default: print("**Error")
        }
    }
}
