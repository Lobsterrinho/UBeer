//
//  BottomSheetCoordinatorProtocol.swift
//  UBeer
//
//  Created by Lobster on 22.04.23.
//

import Foundation

protocol BottomSheetCoordinatorProtocol: AnyObject {
    func finish()
    func shouldMoveToParent(_ shouldMove: Bool)
}