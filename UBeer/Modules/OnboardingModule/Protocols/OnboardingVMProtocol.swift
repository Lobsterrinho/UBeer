//
//  OnboardingVMProtocol.swift
//  UBeer
//
//  Created by Lobster on 18.03.23.
//

import UIKit

protocol OnboardingVMProtocol {
    
    func setupViewDelegate(_ delegate: OnboardingVMDelegate)
    func setupPageView(pageView: UIPageViewController, pageControl: UIPageControl)
    func skipUnboarding()
    func continueToNextPage()
    
}
