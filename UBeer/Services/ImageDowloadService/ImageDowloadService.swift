//
//  ImageDowloadService.swift
//  UBeer
//
//  Created by Lobster on 1.08.23.
//

import Foundation
import UIKit

typealias DownloadHandler = (Result<UIImage?, Error>) -> Void

final class ImageDowloadService: DIImageDownloadServiceProtocol {
    
    func downloadImage(imageURL: String,
                       completion: @escaping DownloadHandler) {
        guard let url = URL(string: imageURL) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 10.0
        
        URLSession.shared.downloadTask(with: request) { fileURL, response, error in
            if let error = error {
                completion(.failure(error))
            }
            if let url = fileURL,
                let data = try? Data(contentsOf: url),
                let image = UIImage(data: data) {
                completion(.success(image))
            }
        }.resume()
    }
    
    
}
