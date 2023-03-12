//
//  RegisterVMDelegate.swift
//  UBeer
//
//  Created by Lobster on 12.03.23.
//

import Foundation

protocol RegisterViewModelDelegate: AnyObject {
    func RegisterFinished(with login: String)
}
