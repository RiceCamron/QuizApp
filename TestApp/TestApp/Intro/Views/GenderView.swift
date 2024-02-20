//
//  GenderView.swift
//  TestApp
//
//  Created by Artur Avdeev on 02.02.2024.
//

import UIKit

class GenderView: UIView {
    
    let blockImage: UIImageView = {
        let image = UIImage(named: "genderBlock")
        let view = UIImageView()
        view.image = image
        view.contentMode = .scaleAspectFit
        view.widthAnchor.constraint(equalToConstant: 380).isActive = true
        view.heightAnchor.constraint(equalToConstant: 220).isActive = true
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 6)
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.8
        return view
    }()
    
    let titleText: UITextView = {
        let view = UITextView()
        view.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(300))
        view.frame = CGRect(x: 95, y: 20, width: 190, height: 50)
        view.text = "YOUR GENDER"
        view.textColor = .white
        view.backgroundColor = .clear
        view.textAlignment = .center
        return view
    }()
    
    var maleBtn: UIButton!
    var femaleBtn: UIButton!
    var otherBtn: UIButton!
    
    let maleBtnLabel: UILabel = {
        let label = UILabel()
        label.text = "Male"
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let femaleBtnLabel: UILabel = {
        let label = UILabel()
        label.text = "Female"
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let otherBtnLabel: UILabel = {
        let label = UILabel()
        label.text = "Other"
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
        
    
    init() {
        super.init(frame: .zero)
        
        configureAppearance()
        setupViews()
        constrainViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureAppearance() {
        
        maleBtn = createButton(imageName: "maleOnBtn", title: "Male")
        femaleBtn = createButton(imageName: "femaleOffBtn", title: "Female")
        otherBtn = createButton(imageName: "otherOffBtn", title: "Other")    }
    
    func constrainViews() {
        blockImage.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        blockImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        NSLayoutConstraint.activate([
            
            maleBtn.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: 0),
            maleBtn.leadingAnchor.constraint(equalTo: blockImage.leadingAnchor, constant: 70),
            maleBtn.widthAnchor.constraint(equalToConstant: 110),
            maleBtn.heightAnchor.constraint(equalToConstant: 40),
            
            maleBtnLabel.centerYAnchor.constraint(equalTo: maleBtn.centerYAnchor),
            maleBtnLabel.centerXAnchor.constraint(equalTo: maleBtn.centerXAnchor),
            
            femaleBtn.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: 0),
            femaleBtn.trailingAnchor.constraint(equalTo: blockImage.trailingAnchor, constant: -70),
            femaleBtn.widthAnchor.constraint(equalToConstant: 110),
            femaleBtn.heightAnchor.constraint(equalToConstant: 40),
            
            femaleBtnLabel.centerYAnchor.constraint(equalTo: femaleBtn.centerYAnchor),
            femaleBtnLabel.centerXAnchor.constraint(equalTo: femaleBtn.centerXAnchor),
            
            otherBtn.topAnchor.constraint(equalTo: maleBtn.bottomAnchor, constant: 30),
            otherBtn.leadingAnchor.constraint(equalTo: blockImage.leadingAnchor, constant: 70),
            otherBtn.widthAnchor.constraint(equalToConstant: 110),
            otherBtn.heightAnchor.constraint(equalToConstant: 40),
            
            otherBtnLabel.centerYAnchor.constraint(equalTo: otherBtn.centerYAnchor),
            otherBtnLabel.centerXAnchor.constraint(equalTo: otherBtn.centerXAnchor),
        ])
    }
    
    
    func setupViews() {
        setupView(blockImage)
        blockImage.addSubview(titleText)
        setupView(maleBtn)
        setupView(maleBtnLabel)
        setupView(femaleBtn)
        setupView(femaleBtnLabel)
        setupView(otherBtn)
        setupView(otherBtnLabel)
    }
    
    func setupView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
           maleBtn.setImage(sender == maleBtn ? UIImage(named: "maleOnBtn") : UIImage(named: "maleOffBtn"), for: .normal)
           femaleBtn.setImage(sender == femaleBtn ? UIImage(named: "femaleOnBtn") : UIImage(named: "femaleOffBtn"), for: .normal)
           otherBtn.setImage(sender == otherBtn ? UIImage(named: "otherOnBtn") : UIImage(named: "otherOffBtn"), for: .normal)
        
        if sender == maleBtn {
            IntroRegViewController.selectedGender = "Male"
        } else if sender == femaleBtn {
            IntroRegViewController.selectedGender = "Female"
        } else if sender == otherBtn {
            IntroRegViewController.selectedGender = "Other"
        }
       }
    
    func createButton(imageName: String, title: String) -> UIButton {
           let btn = UIButton()
           btn.setImage(UIImage(named: imageName), for: .normal)
           btn.layer.shadowColor = UIColor.black.cgColor
           btn.layer.shadowOffset = CGSize(width: 0, height: 6)
           btn.layer.shadowRadius = 10
           btn.layer.shadowOpacity = 0.8
           btn.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
           return btn
       }
}
