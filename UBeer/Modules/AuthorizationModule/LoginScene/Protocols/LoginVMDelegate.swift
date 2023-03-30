//
//  LoginVMDelegate.swift
//  UBeer
//
//  Created by Lobster on 29.03.23.
//

import UIKit

protocol LoginVMDelegate: AnyObject {
    func getEmail(_ email: String)
}
