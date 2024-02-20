//
//  ProfileEditView.swift
//  TestApp
//
//  Created by Artur Avdeev on 07.02.2024.
//


import UIKit

class ProfileEditVC: UIViewController {
    //    let textField = RegTextFieldView()
    
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
        let backgroundImage = UIImage(named: "introBg3")
        let layer = CALayer()
        layer.contents = backgroundImage?.cgImage
        //        layer.contentsGravity = .resizeAspectFill
        layer.frame = CGRect(x: -10, y: 100, width: 410, height: 600)
        return layer
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = -50
        return stackView
    }()
    
    let images: [UIImage?] = [
        UIImage(named: "nameBlock"),
        UIImage(named: "ageBlock"),
    ]
    
    let textFields: [RegTextFieldView] = [
        RegTextFieldView(image: UIImage(named: "nameBlock"), titleText: "TEXT YOUR NAME", hintText: "name is...", keyboardType: .default),
        RegTextFieldView(image: UIImage(named: "ageBlock"), titleText: "YOUR AGE", hintText: "age is...", keyboardType: .numberPad),
    ]
    
    
    let applyBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "deleteBtn"), for: .normal)
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOffset = CGSize(width: 0, height: 6)
        btn.layer.shadowRadius = 10
        btn.layer.shadowOpacity = 0.8
        btn.addTarget(self, action: #selector(applyButtonTapped(_:)), for: .touchUpInside)
        return btn
    }()
    
    let applyBtnLabel: UILabel = {
        let label = UILabel()
        label.text = "APPLY"
        label.font = UIFont(name: "Inter-Regular", size: 26)
        label.font = UIFont.systemFont(ofSize: 26, weight: UIFont.Weight(350))
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    var nameTextField: String!
    var ageTextField: String!
    var selectedGender: String! = "Male"

    var genderView: GenderView!
    
    var isRegDataNotEmpty = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        configureAppearance()
        setupViews()
        constrainViews()
    }
    
}
extension ProfileEditVC {
    func configureAppearance() {
        gradientLayer.frame = view.bounds
        
        genderView = GenderView()

        
        for textField in textFields {
            stackView.addArrangedSubview(textField)
        }
        stackView.addArrangedSubview(genderView)
        
        
        textFields[0].textDidChangeClosure = { [self] in
            setStaticProperties()
        }
        textFields[1].textDidChangeClosure = { [self] in
            setStaticProperties()
        }
    }
    
    func setupViews() {
        view.layer.insertSublayer(gradientLayer, at: 0)
        view.layer.addSublayer(backgroundLayer)
        
        setupView(stackView)
        setupView(applyBtn)
        setupView(applyBtnLabel)
    }
    
    func constrainViews() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -50),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
            
            
            applyBtn.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 40),
            applyBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            applyBtn.widthAnchor.constraint(equalToConstant: 180),
            applyBtn.heightAnchor.constraint(equalToConstant: 60),
            
            applyBtnLabel.centerYAnchor.constraint(equalTo: applyBtn.centerYAnchor),
            applyBtnLabel.centerXAnchor.constraint(equalTo: applyBtn.centerXAnchor),
            applyBtnLabel.leadingAnchor.constraint(equalTo: applyBtn.leadingAnchor, constant: 15),
            applyBtnLabel.topAnchor.constraint(equalTo: applyBtn.topAnchor, constant: 0),
            applyBtnLabel.widthAnchor.constraint(equalTo: applyBtn.widthAnchor),
            applyBtnLabel.heightAnchor.constraint(equalTo: applyBtn.heightAnchor),
        ])
    }
    
    private func setupView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(view)
    }
    
    @objc func applyButtonTapped(_ sender: UIButton) {
            guard let username = IntroRegViewController.nameTextField,
                  let ageString = IntroRegViewController.ageTextField,
                  let gender = IntroRegViewController.selectedGender,
                  username != "", ageString != "", gender != "" else {
                isRegDataNotEmpty = false
                return
            }
            
            // Save user information to UserDefaults
            UserSettings.username = username
            UserSettings.age = ageString
            UserSettings.gender = gender
            
            isRegDataNotEmpty = true
            
            if isRegDataNotEmpty == true {
                let vc = TabBarController()
                navigationController?.pushViewController(vc, animated: true)
            } else {
                
            }
    }
    
    func setData(_ data: IntroData) {
        backgroundLayer.contents = data.backgroundImage?.cgImage
    }
    
    func setStaticProperties() {
          IntroRegViewController.nameTextField = textFields[0].textFieldValue
          IntroRegViewController.ageTextField = textFields[1].textFieldValue
      }
}
