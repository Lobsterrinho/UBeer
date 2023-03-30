//
//  OnboardingAdapterProtocol.swift
//  UBeer
//
//  Created by Lobster on 20.03.23.
//

import UIKit

protocol OnboardingAdapterProtocol {
    
    func setupPageView(pageView: UIPageViewController,
                       pages: [Pages])
    func setupOnboardingAdapterPageDelegate(_ currentPageDelegate: OnboardingAdapterPageDelegate)
    func pageControllerDidTap(_ currentPage: Int)
    func listToNextPage()
}
