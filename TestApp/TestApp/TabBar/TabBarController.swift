//
//  TabBarController.swift
//  TestApp
//
//  Created by Artur Avdeev on 04.02.2024.
//

import UIKit

class TabBarController: UIViewController {

    var quizViewController: UIViewController!
    var statsViewController: UIViewController!
    var profileViewController: UIViewController!

   //
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
           let backgroundImage = UIImage(named: "quizBg")
           let layer = CALayer()
           layer.contents = backgroundImage?.cgImage
           return layer
       }()
   
       let quizBtn: UIButton = {
           let button = UIButton()
           button.backgroundColor = .white
           button.layer.cornerRadius = 35
           button.alpha = 0.1
           button.translatesAutoresizingMaskIntoConstraints = false
           button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
           return button
       }()
   
       let quizIconView: UIImageView = {
           let imageView = UIImageView()
           imageView.contentMode = .scaleAspectFit
           imageView.translatesAutoresizingMaskIntoConstraints = false
           imageView.image = UIImage(named: "homeIcon")
           return imageView
       }()
   
       let statsBtn: UIButton = {
           let button = UIButton()
           button.backgroundColor = .white
           button.layer.cornerRadius = 35
           button.alpha = 0.1
           button.translatesAutoresizingMaskIntoConstraints = false
           button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
           return button
       }()
   
       let statsIconView: UIImageView = {
           let imageView = UIImageView()
           imageView.contentMode = .scaleAspectFit
           imageView.translatesAutoresizingMaskIntoConstraints = false
           imageView.image = UIImage(named: "statsIcon")
           return imageView
       }()
   
       let profileBtn: UIButton = {
           let button = UIButton()
           button.backgroundColor = .white
           button.layer.cornerRadius = 35
           button.alpha = 0.1
           button.translatesAutoresizingMaskIntoConstraints = false
           button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
           return button
       }()
   
       let profileIconView: UIImageView = {
           let imageView = UIImageView()
           imageView.contentMode = .scaleAspectFit
           imageView.translatesAutoresizingMaskIntoConstraints = false
           imageView.image = UIImage(named: "profileIcon")
           return imageView
       }()
   
   
       let circularShadow: CircleShadow = {
           let shadow = CircleShadow()
           shadow.translatesAutoresizingMaskIntoConstraints = false
           return shadow
       }()
       var selectedButton: UIButton?
   
       var selectedButtonShadow: CircleShadow?
       

    override func viewDidLoad() {
        super.viewDidLoad()

        quizViewController = QuizVC()
        statsViewController = StatsVC()
        profileViewController = ProfileVC()

        configureAppearance()
        setupViews()
        constrainViews()

        selectedButton = quizBtn
        buttonTapped(selectedButton!)
        addCircularShadow(to: quizBtn)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let statsViewController = statsViewController as? StatsVC {
            statsViewController.statisticView.configureAppearance()
            
        }
    }

    @objc func buttonTapped(_ sender: UIButton) {
        removeCircularShadow(from: quizBtn)
        removeCircularShadow(from: statsBtn)
        removeCircularShadow(from: profileBtn)

        addCircularShadow(to: sender)
        selectedButton = sender

        switch sender {
        case quizBtn:
            displayContent(quizViewController)
            backgroundLayer.contents = UIImage(imageLiteralResourceName: "quizBg").cgImage
            backgroundLayer.frame = CGRect(x: 0, y: 140, width: view.frame.width + 20, height: view.frame.height-420)
        case statsBtn:
            displayContent(statsViewController)
            backgroundLayer.contents = UIImage(imageLiteralResourceName: "statsBg").cgImage
            backgroundLayer.frame = CGRect(x: 0, y: 50, width: view.frame.width - 10, height: view.frame.height-350)
        case profileBtn:
            displayContent(profileViewController)
            backgroundLayer.contents = UIImage(imageLiteralResourceName: "profileBg").cgImage
            backgroundLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width - 10, height: view.frame.height-450)
        default:
            break
        }
    }


        func addCircularShadow(to button: UIButton) {
            let shadowView = CircleShadow()
            shadowView.frame = button.bounds
            button.addSubview(shadowView)
            selectedButtonShadow = shadowView
        }
    
        func removeCircularShadow(from button: UIButton) {
            button.subviews.forEach { subview in
                if let shadow = subview as? CircleShadow {
                    shadow.removeFromSuperview()
                }
            }
            selectedButton = nil
            selectedButtonShadow = nil
        }
    
    func displayContent(_ contentViewController: UIViewController) {
        children.forEach { child in
            child.willMove(toParent: nil)
            child.view.removeFromSuperview()
            child.removeFromParent()
        }

        addChild(contentViewController)
        
        contentViewController.view.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height-160)
        view.addSubview(contentViewController.view)
        contentViewController.didMove(toParent: self)
    }

    }
    
    extension TabBarController{
        func configureAppearance() {
            gradientLayer.frame = view.bounds
            navigationController?.navigationBar.isHidden = true
        }
    
        func setupViews() {
            view.layer.addSublayer(backgroundLayer)
            view.layer.insertSublayer(gradientLayer, at: 0)
            setupView(quizBtn)
            setupView(quizIconView)
            setupView(statsBtn)
            setupView(statsIconView)
            setupView(profileBtn)
            setupView(profileIconView)
    //        setupView(profileEditBtn)
        }
    
        func constrainViews() {
            NSLayoutConstraint.activate([
    
                // Круглая кнопка
                quizBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
                quizBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
                quizBtn.widthAnchor.constraint(equalToConstant: 70),
                quizBtn.heightAnchor.constraint(equalToConstant: 70),
    
                // Иконка внутри круглой кнопки
                quizIconView.centerXAnchor.constraint(equalTo: quizBtn.centerXAnchor),
                quizIconView.centerYAnchor.constraint(equalTo: quizBtn.centerYAnchor),
                quizIconView.widthAnchor.constraint(equalTo: quizBtn.widthAnchor, multiplier: 0.5),
                quizIconView.heightAnchor.constraint(equalTo: quizBtn.heightAnchor, multiplier: 0.5),
    
    
                // Круглая кнопка
                statsBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                statsBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
                statsBtn.widthAnchor.constraint(equalToConstant: 70),
                statsBtn.heightAnchor.constraint(equalToConstant: 70),
    
                // Иконка внутри круглой кнопки
                statsIconView.centerXAnchor.constraint(equalTo: statsBtn.centerXAnchor),
                statsIconView.centerYAnchor.constraint(equalTo: statsBtn.centerYAnchor),
                statsIconView.widthAnchor.constraint(equalTo: statsBtn.widthAnchor, multiplier: 0.5),
                statsIconView.heightAnchor.constraint(equalTo: statsBtn.heightAnchor, multiplier: 0.5),
    
    
                // Круглая кнопка
                profileBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
                profileBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
                profileBtn.widthAnchor.constraint(equalToConstant: 70),
                profileBtn.heightAnchor.constraint(equalToConstant: 70),
    
                // Иконка внутри круглой кнопки
                profileIconView.centerXAnchor.constraint(equalTo: profileBtn.centerXAnchor),
                profileIconView.centerYAnchor.constraint(equalTo: profileBtn.centerYAnchor),
                profileIconView.widthAnchor.constraint(equalTo: profileBtn.widthAnchor, multiplier: 0.5),
                profileIconView.heightAnchor.constraint(equalTo: profileBtn.heightAnchor, multiplier: 0.5),
    
            ])
        }
    
        func setupView(_ view: UIView) {
            view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(view)
        }
    
        func createButton() -> UIButton {
    
                let button = UIButton()
                button.backgroundColor = .white
                button.layer.cornerRadius = 35
                button.alpha = 0.1
                button.translatesAutoresizingMaskIntoConstraints = false
                button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
                return button
        }
    
        public func editProfileBtn(_ sender: UIButton) {
            print("Qwe")
            let vc = ProfileEditVC()
    
            if let navigationController = navigationController {
                navigationController.pushViewController(vc, animated: true)
            } else {
                print("Navigation controller is nil")
            }
        }
    
    }
