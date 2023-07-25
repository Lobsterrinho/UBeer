//
//  LoadCheckInsRealtimeDBServiceProtocol.swift
//  UBeer
//
//  Created by Lobster on 22.07.23.
//

import Foundation

protocol LoadCheckInsRealtimeDBServiceProtocol {
    func loadCheckIns(completion: @escaping (UsersCheckIns) -> Void)
}
