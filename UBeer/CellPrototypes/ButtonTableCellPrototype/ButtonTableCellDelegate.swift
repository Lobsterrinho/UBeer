//
//  ButtonTableCellDelegate.swift
//  UBeer
//
//  Created by Lobster on 3.05.23.
//

import Foundation
import UIKit

protocol ButtonTableCellDelegate: AnyObject {
    func buttonDidTap(_ sender: UIButton)
}
