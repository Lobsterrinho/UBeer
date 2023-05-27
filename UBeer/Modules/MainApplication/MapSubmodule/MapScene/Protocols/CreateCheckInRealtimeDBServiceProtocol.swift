//
//  CreateCheckInRealtimeDBServiceProtocol.swift
//  UBeer
//
//  Created by Lobster on 10.04.23.
//

import Foundation

protocol CreateCheckInRealtimeDBServiceProtocol {
    
    func loadUsers(completion: @escaping (User?, Error?) -> Void)
    func addUser()
}
