//
//  LottieAnimationAlertVC.swift
//  UBeer
//
//  Created by Lobster on 17.06.23.
//

import Foundation
import UIKit
import Lottie

final class LottieAnimationAlertVC: UIViewController {
    
    private weak var centeredView: UIView!
    private weak var lottieAnimationView: LottieAnimationView!
    
    private weak var delegate: LottieAnimationDelegate?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black.withAlphaComponent(0.3)
        
        setupCenteredView()
        setupCenteredViewConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        startAnimation()
    }
    
    func setupLottieDelegate(_ delegate: LottieAnimationDelegate) {
        self.delegate = delegate
    }
    
    private func setupCenteredView() {
        let alert = UIView()
        alert.backgroundColor = .mainWhite
        alert.layer.masksToBounds = true
        alert.layer.cornerRadius = 12
        alert.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(alert)
        self.centeredView = alert
    }
    
    func setupLottieAnimationView(name: String) {
        let image = LottieAnimationView(name: name)
        image.loopMode = .playOnce
        image.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(image)
        self.lottieAnimationView = image
        setupLottieAnimationViewConstraints()
    }
    
    private func startAnimation() {
        //Call the dismissController method when animation did ended
        lottieAnimationView.play { _ in
            self.lottieAnimationView.stop()
            self.delegate?.animationDidEnded()
        }
    }
    
    private func setupCenteredViewConstraints() {
        let heightAndWidth = self.view.frame.width / 2.5
        NSLayoutConstraint.activate([
            centeredView.heightAnchor.constraint(equalToConstant: heightAndWidth),
            centeredView.widthAnchor.constraint(equalToConstant: heightAndWidth),
            centeredView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            centeredView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
    }
    
    private func setupLottieAnimationViewConstraints() {
        NSLayoutConstraint.activate([
            lottieAnimationView.topAnchor.constraint(equalTo: centeredView.topAnchor,
                                                     constant: 10.0),
            lottieAnimationView.leadingAnchor.constraint(equalTo: centeredView.leadingAnchor,
                                                         constant: 10.0),
            lottieAnimationView.trailingAnchor.constraint(equalTo: centeredView.trailingAnchor,
                                                          constant: -10.0),
            lottieAnimationView.bottomAnchor.constraint(equalTo: centeredView.bottomAnchor,
                                                        constant: -10.0)
        ])
    }
}
