//
//  HomeVM.swift
//  UBeer
//
//  Created by Lobster on 23.03.23.
//

import UIKit

final class ProfileVM: ProfileVMProtocol {
    
    private var coordinator: ProfileCoordinatorProtocol
    
    init(coordinator: ProfileCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func openSettings() {
        coordinator.openSettingsScene()
    }
    
}
