//
//  CheckInSections.swift
//  UBeer
//
//  Created by Lobster on 23.04.23.
//

import Foundation

enum CheckInSections {
    case photo
    case textField([CheckInItems])
    case button
    
    var rowCount: Int {
        switch self {
        case .photo:                 return 1
        case .textField(let items):  return items.count
        case .button:                return 1
        }
    }
}


