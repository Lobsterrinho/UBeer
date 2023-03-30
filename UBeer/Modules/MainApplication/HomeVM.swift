//
//  HomeVM.swift
//  UBeer
//
//  Created by Lobster on 23.03.23.
//

import UIKit

final class HomeVM: HomeVMProtocol {
    
    private var coordinator: HomeCoordinatorProtocol?
    
    init(coordinator: HomeCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
}
