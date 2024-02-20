//
//  ProgressBarView.swift
//  TestApp
//
//  Created by Artur Avdeev on 10.02.2024.
//

import UIKit

class ProgressBarView: UIView {
    
    let progressBar: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 250, height: 14)
        return view
    }()
    
    let lineProgress: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.heightAnchor.constraint(equalToConstant: 2).isActive = true
        view.widthAnchor.constraint(equalToConstant: 250).isActive = true
        return view
    }()
    
    init(percent: CGFloat) {
        super.init(frame: .zero)
        
        // Set the background color of progressBar
        progressBar.backgroundColor = .lightGray
        
        // Create a gradient layer for progressBar
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = progressBar.bounds
        gradientLayer.colors = [UIColor(hexString: "#C37601").cgColor, UIColor(hexString: "#F2B640").cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        
        // Add the gradient layer to UIView
        progressBar.layer.addSublayer(gradientLayer)
        
        // Create a mask for progressBar
        let maskLayer = CALayer()
        maskLayer.frame = CGRect(x: 0, y: 0, width: progressBar.bounds.width * (percent * 0.01), height: progressBar.bounds.height)
        maskLayer.backgroundColor = UIColor.black.cgColor
        
        // Add the mask to UIView
        progressBar.layer.mask = maskLayer
        
        // Add lineProgress as a subview of progressBar
        
        addSubview(progressBar)
        addSubview(lineProgress)
        
        // Set lineProgress constraints
        NSLayoutConstraint.activate([
            lineProgress.leadingAnchor.constraint(equalTo: progressBar.leadingAnchor),
            lineProgress.bottomAnchor.constraint(equalTo: progressBar.bottomAnchor),
            lineProgress.widthAnchor.constraint(equalTo: widthAnchor),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
