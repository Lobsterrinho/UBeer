//
//  BottomSheetAdapterProtocol.swift
//  UBeer
//
//  Created by Lobster on 22.04.23.
//

import Foundation
import UIKit

protocol BottomSheetAdapterProtocol {
    func setupTableView(_ tableView: UITableView)
    func setupSections(_ sections: [BottomSheetSections])
}
