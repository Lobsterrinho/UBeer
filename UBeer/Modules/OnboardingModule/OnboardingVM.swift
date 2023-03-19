//
//  OnboardingVM.swift
//  UBeer
//
//  Created by Lobster on 18.03.23.
//

import Foundation

final class OnboardingVM: OnbordingVMProtocol {
    
    private weak var coordinator: OnboardingCoordinatorProtocol?
    
    init(coordinator: OnboardingCoordinatorProtocol) {
        self.coordinator = coordinator
    }
}
