//
//  Sections.swift
//  UBeer
//
//  Created by Lobster on 2.04.23.
//

import UIKit

enum Sections {
    
    case account([SettingsItem])
    case preferences([SettingsItem])
    case links([SettingsItem])
    
    var rowCount: Int {
        switch self {
        case .account(let items):      return items.count
        case .links(let items):        return items.count
        case .preferences(let items):  return items.count
        }
    }
    
    var sectionTitle: String {
        switch self {
        case .account(_): return "Account"
        case .preferences(_): return "Preferences"
        case .links(_): return "Links"
        }
    }
    
    var settingsItems: [SettingsItem] {
        switch self {
        case .account(let items):      return items
        case .links(let items):        return items
        case .preferences(let items):  return items
        }
    }
    
}


