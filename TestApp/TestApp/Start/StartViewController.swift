//
//  StartViewController.swift
//  TestApp
//
//  Created by Artur Avdeev on 03.02.2024.
//

import UIKit

class StartViewController: UIViewController {
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
        let backgroundImage = UIImage(named: "startBg")
        let layer = CALayer()
        layer.contents = backgroundImage?.cgImage
        return layer
    }()
    
    let blockImage: UIImageView = {
        let image = UIImage(named: "startBlock2")
        let view = UIImageView()
        view.image = image
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 6)
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.8
        return view
    }()
    
    let startButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "startBtn"), for: .normal)
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOffset = CGSize(width: 0, height: 6)
        btn.layer.shadowRadius = 10
        btn.layer.shadowOpacity = 0.8
        btn.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    let startBtnLabel: UILabel = {
        let label = UILabel()
        label.text = "START"
        label.font = UIFont(name: "Inter-Regular", size: 38)
        label.font = UIFont.systemFont(ofSize: 38, weight: UIFont.Weight(350))
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "READY TO BE PRO?", attributes: [
            .strokeColor: UIColor(hexString: "#CC8F25"),
            .foregroundColor: UIColor.clear,
            .strokeWidth: -4,
            .font: UIFont(name: "Inter-Regular", size: 28)!,
        ])
        
        let angle = -CGFloat.pi / 8.0
        label.transform = CGAffineTransform(rotationAngle: angle)
        
        return label
    }()
    
    let descLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "PLAYER NAMES, RULES, TACTICS, DIFFICULTY LEVELS", attributes: [
            //            .strokeColor: UIColor.white,
            .foregroundColor: UIColor.white,
            .strokeWidth: -4,
            .font: UIFont(name: "Inter-Regular", size: 20)!,
        ])
        
        let angle = -CGFloat.pi / 8.0
        label.transform = CGAffineTransform(rotationAngle: angle)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let trophyImage: UIImageView = {
        let image = UIImage(named: "trophy")
        let view = UIImageView()
        view.image = image
        let angle = -CGFloat.pi / 53.0
        view.transform = CGAffineTransform(rotationAngle: angle)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        setupViews()
        constrainViews()
    }
    
}

extension StartViewController{
    func configureAppearance() {
        gradientLayer.frame = view.bounds
        
        backgroundLayer.frame = CGRect(x: -30, y: -40, width: view.frame.width + 110, height: view.frame.height+80)
        
        
    }
    
    func setupViews() {
        view.layer.insertSublayer(gradientLayer, at: 0)
        view.layer.addSublayer(backgroundLayer)
        setupView(blockImage)
        setupView(startButton)
        setupView(startBtnLabel)
        setupView(titleLabel)
        setupView(descLabel)
        setupView(trophyImage)
    }
    
    func constrainViews() {
        NSLayoutConstraint.activate([
            blockImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            blockImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            blockImage.widthAnchor.constraint(equalToConstant: 310),
            blockImage.heightAnchor.constraint(equalToConstant: 580),
            
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.widthAnchor.constraint(equalToConstant: 180),
            startButton.heightAnchor.constraint(equalToConstant: 60),
            
            startBtnLabel.centerYAnchor.constraint(equalTo: startButton.centerYAnchor),
            startBtnLabel.centerXAnchor.constraint(equalTo: startButton.centerXAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: blockImage.topAnchor, constant: 150),
            titleLabel.leadingAnchor.constraint(equalTo: blockImage.leadingAnchor, constant: 25),
            
            descLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descLabel.leadingAnchor.constraint(equalTo: blockImage.leadingAnchor, constant: 40),
            descLabel.widthAnchor.constraint(equalToConstant: 270),
            
            trophyImage.topAnchor.constraint(equalTo: descLabel.bottomAnchor, constant: 20),
            trophyImage.leadingAnchor.constraint(equalTo: blockImage.leadingAnchor, constant: 40),
            trophyImage.heightAnchor.constraint(equalToConstant: 250),
            trophyImage.widthAnchor.constraint(equalToConstant: 250),
        ])
    }
    
    func setupView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(view)
    }
    
    
    @objc func startButtonTapped() {
        let vc = TabBarController()
        self.navigationController?.pushViewController(vc, animated: true)
//        vc.modalPresentationStyle = .fullScreen
//        present(vc, animated: false)
    }
}
