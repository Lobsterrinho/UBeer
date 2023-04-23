//
//  SettingsAuthorizationService.swift
//  UBeer
//
//  Created by Lobster on 4.04.23.
//

import Foundation

protocol SettingsAuthorizationServiceProtocol {
    func signOut(completion: @escaping (NSError?) -> Void)
}
