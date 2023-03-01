//
//  Coordinator.swift
//  UBeer
//
//  Created by Lobster on 28.02.23.
//

import Foundation

protocol Coordinator: AnyObject {
    
    var childCoordinators: [Coordinator] { get }
    
    func start()
    func finish()
    
    
}
