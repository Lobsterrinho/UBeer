//
//  ImageDownloadServiceProtocol.swift
//  UBeer
//
//  Created by Lobster on 2.08.23.
//

import UIKit

protocol ImageDownloadServiceProtocol {
    
    func downloadImage(imageURL: String,
                       completion: @escaping DownloadHandler)
}
