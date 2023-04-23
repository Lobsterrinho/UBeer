//
//  BottomSheetSections.swift
//  UBeer
//
//  Created by Lobster on 23.04.23.
//

import UIKit

enum BottomSheetSections {
    
    case distance(MapPinInfo)
    
    
    var rowCount: Int {
        switch self {
        case .distance(_): return 1
       
        }
    }
    
    var MapPinItems: MapPinInfo {
        switch self {
        case .distance(let item): return item
        
        }
    }
    
}
