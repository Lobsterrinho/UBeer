//
//  ProfileRootCoordinatorProtocol.swift
//  UBeer
//
//  Created by Lobster on 24.03.23.
//

import Foundation

protocol ProfileRootCoordinatorProtocol: AnyObject {
    func profileSceneFinished(_ coordinator: Coordinator)
    func profileSceneFinishedWithSignOut(_ coordinator: Coordinator)
}
