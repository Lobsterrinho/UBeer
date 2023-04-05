//
//  MapAdapterProtocol.swift
//  UBeer
//
//  Created by Lobster on 5.04.23.
//

import UIKit

protocol MapAdapterProtocol {
    
    func setupTableView(_ tableView: UITableView)
    func setupSections(_ sections: [MapSections])
}
