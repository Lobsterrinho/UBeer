//
//  HomeVM.swift
//  UBeer
//
//  Created by Lobster on 23.03.23.
//

import UIKit

final class ProfileVM: ProfileVMProtocol {
    
    #warning("Why cant make weak var profile protocol")
    private var coordinator: ProfileCoordinatorProtocol
    
    init(coordinator: ProfileCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func openSettings() {
        coordinator.openSettingsScene()
    }
    
}
