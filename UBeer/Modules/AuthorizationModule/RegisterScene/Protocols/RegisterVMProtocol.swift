//
//  RegisterVMProtocol.swift
//  UBeer
//
//  Created by Lobster on 1.03.23.
//

import Foundation

protocol RegisterVMProtocol {
    
    func register(email: String?, password: String?)
    func finish(shouldMovetoParentVC: Bool)

    var email: String? { get }
}
