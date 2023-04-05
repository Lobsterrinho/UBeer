//
//  MapVM.swift
//  UBeer
//
//  Created by Lobster on 31.03.23.
//

import UIKit

final class MapVM: MapVMProtocol {
    
    private let sections: [MapSections] = [.map, .checkIn]
    
    private weak var coordinator: MapCoordinatorProtocol?
    private var adapter: MapAdapterProtocol
    
    init(coordinator: MapCoordinatorProtocol,
         adapter: MapAdapterProtocol) {
        self.coordinator = coordinator
        self.adapter = adapter
    }
    
    func setupAdapter(with tableView: UITableView) {
        adapter.setupTableView(tableView)
        setupSections()
    }
    
    func setupSections() {
        adapter.setupSections(sections)
    }
    
    
}
