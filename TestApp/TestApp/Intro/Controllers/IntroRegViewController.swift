//
//  IntroRegViewController.swift
//  TestApp
//
//  Created by Artur Avdeev on 02.02.2024.
//

import UIKit

class IntroRegViewController: UIViewController {
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
        return stackView
    }()
    
    
    let images: [UIImage?] = [
        UIImage(named: "nameBlock"),
        UIImage(named: "ageBlock"),
    ]
    
    let textFields: [RegTextFieldView] = [
        RegTextFieldView(image: UIImage(named: "nameBlock"), titleText: "TEXT YOUR NAME", hintText: "name is...", keyboardType: .default),
        RegTextFieldView(image: UIImage(named: "ageBlock"), titleText: "YOUR AGE", hintText: "age is...", keyboardType: UIKeyboardType.numberPad),
    ]
    
    public static var nameTextField: String!
    public static var ageTextField: String!
    public static var selectedGender: String! = "Male"

    var genderView: GenderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        setupViews()
        constrainViews()
        
    }
}
extension IntroRegViewController {
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
    }
    
    func constrainViews() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -50),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -240),
        ])
    }
    
    private func setupView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(view)
    }
    
    func setData(_ data: IntroData) {
        backgroundLayer.contents = data.backgroundImage?.cgImage
    }
    
    func setStaticProperties() {
          IntroRegViewController.nameTextField = textFields[0].textFieldValue
          IntroRegViewController.ageTextField = textFields[1].textFieldValue
      }
}
