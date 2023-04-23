//
//  BottomSheetAdapter.swift
//  UBeer
//
//  Created by Lobster on 22.04.23.
//

import Foundation
import UIKit

final class BottomSheetAdapter: NSObject, BottomSheetAdapterProtocol {
    
    private weak var tableView: UITableView?
    private var sections: [BottomSheetSections] = []
    
    func setupTableView(_ tableView: UITableView) {
        self.tableView = tableView
        setupTableView()
    }
    
    func setupSections(_ sections: [BottomSheetSections]) {
        self.sections = sections
        reloadData()
    }
    
    private func reloadData() {
        tableView?.reloadData()
    }
    
    private func setupTableView() {
        registerCells()
        tableView?.delegate = self
        tableView?.dataSource = self
        
        tableView?.rowHeight = 48.0
    }
    
    private func registerCells() {
        tableView?.register(DistanceTableCellPrototype.self,
                            forCellReuseIdentifier: "\(DistanceTableCellPrototype.self)")
    }
    
    
}

extension BottomSheetAdapter: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = sections[indexPath.section]
        
        switch section {
        case .distance:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "\(DistanceTableCellPrototype.self)",
                for: indexPath) as? DistanceTableCellPrototype
            cell?.setup(item: section.MapPinItems.distance)
            return cell ?? UITableViewCell()
        }
    }
}

extension BottomSheetAdapter: UITableViewDelegate {
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 100.0
//    }
}
