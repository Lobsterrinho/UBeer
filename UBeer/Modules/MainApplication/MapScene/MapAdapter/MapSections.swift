//
//  Sections.swift
//  UBeer
//
//  Created by Lobster on 5.04.23.
//

import UIKit

enum MapSections {
    case map
    case checkIn
    
    var rowCount: Int {
        switch self {
        case .map: return 1
        case .checkIn: return 2
        }
    }
    
}
