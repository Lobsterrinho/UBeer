//
//  OnboardingAdapterProtocol.swift
//  UBeer
//
//  Created by Lobster on 20.03.23.
//

import UIKit

protocol OnboardingAdapterProtocol {
    
    func setupPageView(pageView: UIPageViewController, pages: [UIViewController], pageControl: UIPageControl)
    
    func setupOnboardingAdapterPageDelegate(_ currentPageDelegate: OnboardingAdapterPageDelegate)
    
    func nextPage()
}
