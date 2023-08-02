//
//  ImageBottomSheetTableCell.swift
//  UBeer
//
//  Created by Lobster on 2.08.23.
//

import UIKit

final class ImageBottomSheetTableCell: UITableViewCell {
    
    private enum Consts {
        static let imageHeightAndWidth: CGFloat = UITableViewCell()
            .frame
            .width - 40.0
        static let defaultSpace: CGFloat = 20.0
    }
    
    private weak var activityIndicator: UIActivityIndicatorView!
    private weak var downloadedImageView: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViewsAndConstraints()
        startIndicatorAnimation()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ image: UIImage) {
        downloadedImageView.image = image
        stopIndicatorAnimation()
    }
    
    private func startIndicatorAnimation() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    private func stopIndicatorAnimation() {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    private func setupViewsAndConstraints() {
        
        setupImageView()
        setupImageViewConstraints()
        
        setupActivityIndicator()
        setupActivityIndicatorConstraints()
        
    }
    
    private func setupImageView() {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8.0
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        self.downloadedImageView = imageView
    }
    
    private func setupActivityIndicator() {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(indicator)
        self.activityIndicator = indicator
    }
    
    private func setupActivityIndicatorConstraints() {
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    private func setupImageViewConstraints() {
        NSLayoutConstraint.activate([
            downloadedImageView.heightAnchor.constraint(equalToConstant: Consts.imageHeightAndWidth),
            downloadedImageView.widthAnchor.constraint(equalToConstant: Consts.imageHeightAndWidth),
            downloadedImageView.topAnchor.constraint(equalTo: self.topAnchor,
                                                     constant: Consts.defaultSpace),
            downloadedImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                         constant: Consts.defaultSpace),
            downloadedImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                          constant: -Consts.defaultSpace),
            downloadedImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                                        constant: -Consts.defaultSpace)
        ])
    }
}
