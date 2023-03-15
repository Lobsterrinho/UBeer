//
//  ForgotPasswordVMDelegate.swift
//  UBeer
//
//  Created by Lobster on 15.03.23.
//

import UIKit

protocol ForgotPasswordVMDelegate: AnyObject {
    
    func passwordChanged(with email: String)
    
}
