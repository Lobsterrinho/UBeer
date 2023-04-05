//
//  SettingsAdapter.swift
//  UBeer
//
//  Created by Lobster on 2.04.23.
//

import UIKit

final class SettingsAdapter: NSObject, SettingsAdapterProtocol {
    
    private weak var tableView: UITableView?
    private var sections: [Sections] = []
    private weak var actionDelegate: SettingsAdapterActionDelegate?
    
    func setupTableView(tableView: UITableView) {
        self.tableView = tableView
        
        setupTableView()
    }
    
    func setupSections(_ sections: [Sections]) {
        self.sections = sections
        reloadData()
    }
    
    private func reloadData() {
        tableView?.reloadData()
    }
    
    private func setupTableView() {
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.register(SettingsTableViewCell.self,
                            forCellReuseIdentifier: "\(SettingsTableViewCell.self)")
        tableView?.rowHeight = 48.0
    }
    
    func setupSettingsAdapterActionDelegate(_ delegate: SettingsAdapterActionDelegate) {
        self.actionDelegate = delegate
    }
    
}

extension SettingsAdapter: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(SettingsTableViewCell.self)",
                                                 for: indexPath) as? SettingsTableViewCell
        let sections = sections[indexPath.section]
        let items = sections.settingsItems
        cell?.setup(item: items[indexPath.row])
        return cell ?? UITableViewCell()
    }
}

extension SettingsAdapter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = sections[section]
        return section.sectionTitle
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0: return 40.0
        default: return 15.0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let sections = sections[indexPath.section]
        let items = sections.settingsItems
        let item = items[indexPath.row]
        actionDelegate?.didSelectItem(settingsItem: item, indexPath: indexPath)
    }
}
