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
        static let headerIconName: String = "mappin.and.ellipse"
    }
    
    private weak var tableView: UITableView?
    
    private var distance: CLLocationDistance?
    private var checkInValues: [String?] = []
    
    private var checkIn: CheckInModel?
    
    private weak var delegate: BottomSheetHeaderDelegate?
    
    
    let array: [Rows] = [.image, .wishes, .numberOfPeople]
    
    
    func setupTableView(_ tableView: UITableView) {
        self.tableView = tableView
        setupTableView()
    }
    
    func setupCheckInValuesAndDistance(model: CheckInModel,
                                       distance: CLLocationDistance) {
        self.distance = distance
        self.checkIn = model
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
        tableView?.allowsSelection = false
        tableView?.dataSource = self
        tableView?.delegate = self
    }
    
    private func registerCells() {
        tableView?.register(BottomSheetTableViewCell.self,
                            forCellReuseIdentifier: "\(BottomSheetTableViewCell.self)")
        tableView?.register(ImageBottomSheetTableCell.self,
                            forCellReuseIdentifier: "\(ImageBottomSheetTableCell.self)")
    }
}

extension BottomSheetAdapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        if checkIn?.imageURL != "" {
            return array.count
        }
        return array.count - 1
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
        
        let imageCell = tableView.dequeueReusableCell(
            withIdentifier: "\(ImageBottomSheetTableCell.self)",
            for: indexPath
        ) as? ImageBottomSheetTableCell
        
        let arr = array[indexPath.row]
        guard let checkIn = checkIn else { return UITableViewCell() }
        
        switch arr {
        case .image:
            if checkIn.imageURL != "" {
                imageCell?.setup(checkIn.image ?? UIImage())
                return imageCell ?? UITableViewCell()
            }
        case .numberOfPeople:
            cell?.setup(checkInValue: checkIn.numberOfPeople)
        case .wishes:
            cell?.setup(checkInValue: checkIn.wishes)
        }
        return cell ?? UITableViewCell()
    }
    
    
}

extension BottomSheetAdapter: UITableViewDelegate { }

enum Rows {
    
    case image
    case numberOfPeople
    case wishes
    
}
