//
//  BottomSheetAdapter.swift
//  UBeer
//
//  Created by Lobster on 22.04.23.
//

import Foundation
import UIKit
import CoreLocation

final class BottomSheetAdapter: NSObject, BottomSheetAdapterProtocol {
    
    private enum Consts {
        static let headerIconName: String = "beerMapIcon"
    }
    
    private weak var tableView: UITableView?
    
    private var distance: CLLocationDistance?
    private var checkInValues: [String] = []
    
    private weak var delegate: BottomSheetHeaderDelegate?
    
    func setupTableView(_ tableView: UITableView) {
        self.tableView = tableView
        setupTableView()
    }
    
    func setupCheckInValuesAndDistance(_ checkInValues: [String],
                    distance: CLLocationDistance) {
        self.checkInValues = checkInValues
        self.distance = distance
        reloadData()
    }
    
    func setupDelegate(_ delegate: BottomSheetHeaderDelegate) {
        self.delegate = delegate
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
        tableView?.register(BottomSheetTableViewCell.self,
                            forCellReuseIdentifier: "\(BottomSheetTableViewCell.self)")
    }
}

extension BottomSheetAdapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return checkInValues.count
    }
    
    func tableView(_ tableView: UITableView,
                   viewForHeaderInSection section: Int) -> UIView? {
        guard let distance = distance else { return nil }
        let header = BottomSheetHeaderView(reuseIdentifier: "\(BottomSheetHeaderView.self)")
        header.setupDelegate(delegate!)
        
        header.setup(distanceToPoint: distance,
                      imageName: Consts.headerIconName)
        return header
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "\(BottomSheetTableViewCell.self)",
            for: indexPath
        ) as? BottomSheetTableViewCell
        
        let value = checkInValues[indexPath.row]
        
        cell?.setup(checkInValue: value)
        
        return cell ?? UITableViewCell()
    }
    
    
}

extension BottomSheetAdapter: UITableViewDelegate {
    

}

//extension BottomSheetAdapter: Delegate {
//    func some() {
//        print("Button did tapped")
//    }
//
//
//}
