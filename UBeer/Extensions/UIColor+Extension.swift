//
//  Color+Extension.swift
//  UBeer
//
//  Created by Lobster on 1.03.23.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init?(hex: String) {
            var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
            hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
            
            let length = hexSanitized.count
            
            var rgb: UInt64 = 0
            
            var r: CGFloat = 0.0
            var g: CGFloat = 0.0
            var b: CGFloat = 0.0
            var a: CGFloat = 1.0
            
            guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }
            
            if length == 6 {
                r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
                g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
                b = CGFloat(rgb & 0x0000FF) / 255.0
            } else if length == 8 {
                r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
                g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
                b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
                a = CGFloat(rgb & 0x000000FF) / 255.0
            } else {
                return nil
            }
            
            self.init(red: r, green: g, blue: b, alpha: a)
        }
    //MARK: - Orange
    static let acc = UIColor(hex: "#FFBD3E")!
    static let highlitedButton = UIColor(hex: "#FFD380")
    static let orange100 = UIColor(hex: "#FBC83C")!
    static let orange80 = UIColor(hex: "#FCD363")!
    static let orange60 = UIColor(hex: "#FDDE8A")!
    
    //MARK: - Yellow
    static let yellow100 = UIColor(hex: "#F4EC1B")!
    static let yellow80 = UIColor(hex: "#F7F048")!
    static let yellow60 = UIColor(hex: "#F9F376")!
    
    //MARK: - Black
    static let black100 = UIColor(hex: "#171518")!
    static let black80 = UIColor(hex: "#38373A")!
    static let black60 = UIColor(hex: "#5A595B")!
    static let black40 = UIColor(hex: "#9D9C9D")!
    static let black5 = UIColor(hex: "#B6B6B6")!
    
    //MARK: - Gray
    static let gray20 = UIColor(hex: "#DFDFDF")!
    static let gray10 = UIColor(hex: "#F6F6F6")!
    
}
