//
//  UIButton+ScaleImage.swift
//  UBeer
//
//  Created by Lobster on 5.06.23.
//

import Foundation
import UIKit

extension UIImage {
    
    static func makeScaledImage(imageName: String,
                                scale: Double) -> UIImage {
        let image = UIImage(systemName: imageName)
        ?? UIImage(named: imageName)
        ?? UIImage(systemName: "photo")!
        let renderer = UIGraphicsImageRenderer(
            size: CGSize(
                width: image.size.width * scale,
                height: image.size.height * scale
            )
        )
        let scaledImage = renderer.image { _ in
            image.draw(
                in: CGRect(
                    origin: .zero,
                    size: CGSize(
                        width: image.size.width * scale,
                        height: image.size.height * scale
                    )
                )
            )
        }
        return scaledImage
    }
    
}
