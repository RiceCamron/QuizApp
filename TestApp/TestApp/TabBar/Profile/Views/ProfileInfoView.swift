//
//  ProfileInfo.swift
//  TestApp
//
//  Created by Artur Avdeev on 07.02.2024.
//

import UIKit

class ProfileInfoView: UIView {
    
    let profileInfoBlock: UIImageView = {
        let image = UIImage(named: "profileBlock")
        let view = UIImageView()
        view.image = image
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 6)
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.8
        return view
    }()
    
    var nameLabel: UILabel!
    var ageLabel: UILabel!
    var genderLabel: UILabel!
    
    var nameValueLabel: UILabel!
    var ageValueLabel: UILabel!
    var genderValueLabel: UILabel!
    
    let profileEditBtn: UIButton = {
        let image = UIImage(named: "profileEditIcon")
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 6)
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.8
        button.addTarget(self, action: #selector(editProfileBtn(_:)), for: .touchUpInside)
        return button
    }()
    
    
    
    
    
    //    let deleteBtn: UIButton = {
    //        let btn = UIButton()
    //        btn.setImage(UIImage(named: "deleteBtn"), for: .normal)
    //        btn.layer.shadowColor = UIColor.black.cgColor
    //        btn.layer.shadowOffset = CGSize(width: 0, height: 6)
    //        btn.layer.shadowRadius = 10
    //        btn.layer.shadowOpacity = 0.8
    //        btn.addTarget(self, action: #selector(deleteButtonTapped(_:)), for: .touchUpInside)
    //        return btn
    //    }()
    //
    //    let deleteBtnLabel: UILabel = {
    //        let label = UILabel()
    //        label.text = "DELETE THIS ACCOUNT"
    //        label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight(350))
    //        label.textAlignment = .left
    //        label.numberOfLines = 0
    //        label.textColor = .white
    //        return label
    //    }()
    
    init() {
        super.init(frame: .zero)
        
        
        configureAppearance()
        setupViews()
        constrainViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ProfileInfoView{
    func configureAppearance() {
        
        
        nameLabel = createLabel(text: "NAME:")
        ageLabel = createLabel(text: "AGE:")
        genderLabel = createLabel(text: "GENDER:")
        
        nameValueLabel = createValueLabel(text: UserSettings.username)
        ageValueLabel = createValueLabel(text: UserSettings.age)
        genderValueLabel = createValueLabel(text: UserSettings.gender)
    }
    
    func setupViews() {
        setupView(profileInfoBlock)
        setupView(nameLabel)
        setupView(ageLabel)
        setupView(genderLabel)
        setupView(nameValueLabel)
        setupView(ageValueLabel)
        setupView(genderValueLabel)
        setupView(profileEditBtn)
    }
    
    func constrainViews() {
        NSLayoutConstraint.activate([
            
            profileInfoBlock.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileInfoBlock.widthAnchor.constraint(equalToConstant: 330),
            profileInfoBlock.heightAnchor.constraint(equalToConstant: 180),
            nameLabel.topAnchor.constraint(equalTo: profileInfoBlock.topAnchor, constant: 40),
            nameLabel.leadingAnchor.constraint(equalTo: profileInfoBlock.leadingAnchor, constant: 50),
            nameLabel.widthAnchor.constraint(equalToConstant: 120),
            
            ageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            ageLabel.leadingAnchor.constraint(equalTo: profileInfoBlock.leadingAnchor, constant: 50),
            ageLabel.widthAnchor.constraint(equalToConstant: 120),
            
            genderLabel.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 20),
            genderLabel.leadingAnchor.constraint(equalTo: profileInfoBlock.leadingAnchor, constant: 50),
            genderLabel.widthAnchor.constraint(equalToConstant: 120),
            
            nameValueLabel.topAnchor.constraint(equalTo: profileInfoBlock.topAnchor, constant: 35),
            nameValueLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),
            nameValueLabel.widthAnchor.constraint(equalToConstant: 120),
            
            ageValueLabel.topAnchor.constraint(equalTo: nameValueLabel.bottomAnchor, constant: 20),
            ageValueLabel.leadingAnchor.constraint(equalTo: ageLabel.trailingAnchor, constant: 10),
            ageValueLabel.widthAnchor.constraint(equalToConstant: 120),
            
            genderValueLabel.topAnchor.constraint(equalTo: ageValueLabel.bottomAnchor, constant: 20),
            genderValueLabel.leadingAnchor.constraint(equalTo: genderLabel.trailingAnchor, constant: 10),
            genderValueLabel.widthAnchor.constraint(equalToConstant: 120),
            
            
            profileEditBtn.widthAnchor.constraint(equalToConstant: 30),
            profileEditBtn.heightAnchor.constraint(equalToConstant: 33),
            profileEditBtn.trailingAnchor.constraint(equalTo: profileInfoBlock.trailingAnchor, constant: -20),
            profileEditBtn.bottomAnchor.constraint(equalTo: profileInfoBlock.bottomAnchor, constant: -20),
            
        ])
    }
    
    func setupView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
    }
    
    
    @objc func buttonTapped(_ sender: UIButton) {
    }
    
    
    func createLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: "Inter-Regular", size: 20)
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        return label
    }
    
    func createValueLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: "Inter-Regular", size: 22)
        label.textColor = UIColor(hexString: "#CC8F25")
        return label
    }
    
    
    @objc func editProfileBtn(_ sender: UIButton) {
        print("asd")
        if let viewController = findViewController() as? ProfileVC {
            viewController.transitionVC()
            }
    }

    private func findViewController() -> UIViewController? {
        var responder: UIResponder? = self
        while let nextResponder = responder?.next {
            responder = nextResponder
            if let viewController = responder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}
