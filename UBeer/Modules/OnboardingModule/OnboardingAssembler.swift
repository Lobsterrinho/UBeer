//
//  OnboardingAssembler.swift
//  UBeer
//
//  Created by Lobster on 18.03.23.
//

import UIKit

final class OnboardingAssembler {
    
    private init() { }
    
    static func makeOnboardingVC(coordinator: OnboardingCoordinatorProtocol)
    -> UIViewController {
        let viewModel = makeViewModel(coordinator: coordinator)
        let viewController = OnboardingVC(viewModel: viewModel)
        return viewController
    }
    
    private static func makeViewModel(coordinator: OnboardingCoordinatorProtocol) -> OnbordingVMProtocol {
        return OnboardingVM(coordinator: coordinator)
    }
    
}
