//
//  IntroViewController.swift
//  TestApp
//
//  Created by Artur Avdeev on 02.02.2024.
//

import UIKit

class IntroViewController: UIViewController {
        let gradientLayer: CAGradientLayer = {
            let layer = CAGradientLayer()
            layer.colors = [
                UIColor(hexString: "393A3A").cgColor,
                UIColor(hexString: "1C1E22").cgColor,
                UIColor(hexString: "101114").cgColor,
            ]
            layer.locations = [0.0, 0.5, 1.0]
            return layer
        }()
    
    let backgroundLayer: CALayer = {
        //        let backgroundImage = UIImage(named: "introBg3")
        let layer = CALayer()
        //        layer.contents = backgroundImage?.cgImage
        layer.frame = CGRect(x: 0, y: 0, width: 410, height: 700)
        return layer
        //        let layer = CALayer()
        //        layer.contentsGravity = .resizeAspectFill
        //        return layer
    }()
    
    
    let blurTitleView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .regular)
        let view = UIVisualEffectView()
        view.layer.cornerRadius = 10
        view.effect = blurEffect
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let introTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight(rawValue: 700))
        return label
    }()
    
    let blurDescView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .regular)
        let view = UIVisualEffectView()
        view.layer.cornerRadius = 10
        view.effect = blurEffect
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let introDescLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        setupViews()
        constrainViews()
    }
    
}

extension IntroViewController{
    func configureAppearance() {
                gradientLayer.frame = view.bounds
    }
    
    func setupViews() {
                view.layer.insertSublayer(gradientLayer, at: 0)
        blurTitleView.contentView.addSubview(introTitleLabel)
        blurDescView.contentView.addSubview(introDescLabel)
        view.layer.addSublayer(backgroundLayer)
        setupView(blurTitleView)
        setupView(blurDescView)
    }
    
    func constrainViews() {
        NSLayoutConstraint.activate([
            blurTitleView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            blurTitleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            blurTitleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            blurTitleView.heightAnchor.constraint(equalToConstant: 70),
            blurTitleView.widthAnchor.constraint(equalToConstant: 10),
            
            introTitleLabel.centerXAnchor.constraint(equalTo: blurTitleView.centerXAnchor),
            introTitleLabel.centerYAnchor.constraint(equalTo: blurTitleView.centerYAnchor),
            introTitleLabel.widthAnchor.constraint(equalToConstant: view.frame.width - 100),
            
            blurDescView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
            blurDescView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            blurDescView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            blurDescView.heightAnchor.constraint(equalToConstant: 100),
            blurDescView.widthAnchor.constraint(equalToConstant: 100),
            
            introDescLabel.centerXAnchor.constraint(equalTo: blurDescView.centerXAnchor),
            introDescLabel.centerYAnchor.constraint(equalTo: blurDescView.centerYAnchor),
            introDescLabel.widthAnchor.constraint(equalToConstant: view.frame.width - 100),
            introDescLabel.topAnchor.constraint(equalTo: blurDescView.topAnchor, constant: 10),
        ])
    }
    
    func setupView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(view)
    }
    
    func setData(_ data: IntroData) {
        introTitleLabel.text = data.title
        introDescLabel.text = data.description
        backgroundLayer.contents = data.backgroundImage?.cgImage
    }
}
