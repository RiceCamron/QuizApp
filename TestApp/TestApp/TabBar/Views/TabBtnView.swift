//////
//////  TabBtnView.swift
//////  TestApp
//////
//////  Created by Artur Avdeev on 04.02.2024.
//////
////
////import UIKit
////
////class TabBtnView: UIView {
////
////    let roundButton: UIButton = {
////        let button = UIButton()
////        button.backgroundColor = .white
////        button.layer.cornerRadius = 35
////        button.alpha = 0.1
////        button.translatesAutoresizingMaskIntoConstraints = false
////        return button
////    }()
////
////    let iconImageView: UIImageView = {
////        let imageView = UIImageView()
////        imageView.contentMode = .scaleAspectFit
////        imageView.translatesAutoresizingMaskIntoConstraints = false
//////        imageView.tintColor = UIColor(hexString: "#CC8F25")
////        return imageView
////    }()
////
////    init(icon: String) {
////        super.init(frame: .zero)
////        
////        iconImageView.image = UIImage(named: icon)
////        setupViews()
////        constrainViews()
////    }
////
////    required init?(coder: NSCoder) {
////        super.init(coder: coder)
////        setupViews()
////        constrainViews()
////    }
////
////    private func setupViews() {
////        setupView(roundButton)
////        setupView(iconImageView)
////    }
////
////    private func constrainViews() {
////        NSLayoutConstraint.activate([
////            // Круглая кнопка
////            roundButton.centerXAnchor.constraint(equalTo: centerXAnchor),
////            roundButton.centerYAnchor.constraint(equalTo: centerYAnchor),
////            roundButton.widthAnchor.constraint(equalToConstant: 70), // Размер круглой кнопки
////            roundButton.heightAnchor.constraint(equalToConstant: 70),
////
////            // Иконка внутри круглой кнопки
////            iconImageView.centerXAnchor.constraint(equalTo: roundButton.centerXAnchor),
////            iconImageView.centerYAnchor.constraint(equalTo: roundButton.centerYAnchor),
////            iconImageView.widthAnchor.constraint(equalTo: roundButton.widthAnchor, multiplier: 0.5),
////            iconImageView.heightAnchor.constraint(equalTo: roundButton.heightAnchor, multiplier: 0.5)
////        ])
////    }
////    
////    
////    func setupView(_ view: UIView) {
////        view.translatesAutoresizingMaskIntoConstraints = false
////        self.addSubview(view)
////    }   
////    
////}
//
//import UIKit
//
//class TabBtnView: UIView {
//
//    let roundButton: UIButton = {
//        let button = UIButton()
//        button.backgroundColor = .white
//        button.layer.cornerRadius = 35
//        button.alpha = 0.1
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//
//    let iconImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFit
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
//
//    init(icon: String) {
//        super.init(frame: .zero)
//        
//        iconImageView.image = UIImage(named: icon)
//        setupViews()
//        constrainViews()
//        setupButtonActions()
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
//
//    private func setupViews() {
//        setupView(roundButton)
//        setupView(iconImageView)
//    }
//
//    private func constrainViews() {
//        NSLayoutConstraint.activate([
//            // Круглая кнопка
//            roundButton.centerXAnchor.constraint(equalTo: centerXAnchor),
//            roundButton.centerYAnchor.constraint(equalTo: centerYAnchor),
//            roundButton.widthAnchor.constraint(equalToConstant: 70),
//            roundButton.heightAnchor.constraint(equalToConstant: 70),
//
//            // Иконка внутри круглой кнопки
//            iconImageView.centerXAnchor.constraint(equalTo: roundButton.centerXAnchor),
//            iconImageView.centerYAnchor.constraint(equalTo: roundButton.centerYAnchor),
//            iconImageView.widthAnchor.constraint(equalTo: roundButton.widthAnchor, multiplier: 0.5),
//            iconImageView.heightAnchor.constraint(equalTo: roundButton.heightAnchor, multiplier: 0.5)
//        ])
//    }
//    
//    private func setupButtonActions() {
//        roundButton.addTarget(self, action: #selector(buttonPressed), for: .touchDown)
//        roundButton.addTarget(self, action: #selector(buttonReleased), for: .touchUpInside)
//        roundButton.addTarget(self, action: #selector(buttonReleased), for: .touchUpOutside)
//        roundButton.isUserInteractionEnabled = true
//    }
//    
//    @objc private func buttonPressed() {
//        print("qwe")
//    }
//    
//    @objc private func buttonReleased() {
//        roundButton.layer.shadowOpacity = 0
//    }
//    
//    func setupView(_ view: UIView) {
//        view.translatesAutoresizingMaskIntoConstraints = false
//        self.addSubview(view)
//    }
//}
