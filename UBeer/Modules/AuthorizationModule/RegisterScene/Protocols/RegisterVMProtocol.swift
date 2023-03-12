//
//  RegisterVMProtocol.swift
//  UBeer
//
//  Created by Lobster on 1.03.23.
//

import Foundation

protocol RegisterVMProtocol {
    
    func register()
    func finish(shouldMovetoParentVC: Bool)
    func setupEmail(completion: (String?) -> Void)
}
