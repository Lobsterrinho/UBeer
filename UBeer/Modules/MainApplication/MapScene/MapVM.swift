//
//  MapVM.swift
//  UBeer
//
//  Created by Lobster on 31.03.23.
//

import UIKit

final class MapVM: MapVMProtocol {
    
    private var coordinator: MapCoordinatorProtocol?
    
    init(coordinator: MapCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
}
