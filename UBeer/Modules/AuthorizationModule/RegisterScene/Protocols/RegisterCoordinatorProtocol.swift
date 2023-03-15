//
//  RegisterCoordinatorProtocol.swift
//  UBeer
//
//  Created by Lobster on 1.03.23.
//

import UIKit

protocol RegisterCoordinatorProtocol: AnyObject {
    
    func presentAlert(_ alert: UIAlertController)
    func finish(shouldMovetoParentVC: Bool)
    
}
