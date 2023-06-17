//
//  UIButton+ScaleImage.swift
//  UBeer
//
//  Created by Lobster on 5.06.23.
//

import Foundation
import UIKit

extension UIImage {
    
    static func makeScaledImage(imageName: String) -> UIImage {
        let image = UIImage(systemName: imageName) ?? UIImage(systemName: "photo")!
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: image.size.width * 1.5, height: image.size.height * 1.5))
        let scaledImage = renderer.image { _ in
            image.draw(in: CGRect(origin: .zero, size: CGSize(width: image.size.width * 1.5, height: image.size.height * 1.5)))
        }
        return scaledImage
    }
    
}
