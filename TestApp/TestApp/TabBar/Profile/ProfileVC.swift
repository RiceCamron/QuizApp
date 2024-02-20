//
//  ProfileView.swift
//  TestApp
//
//  Created by Artur Avdeev on 06.02.2024.
//

import UIKit

class ProfileVC: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "PROFILE", attributes: [
            .strokeColor: UIColor(hexString: "#CC8F25"),
            .foregroundColor: UIColor.clear,
            .strokeWidth: -2,
            .font: UIFont(name: "Inter-Regular", size: 78)!,
        ])
        return label
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    var profileInfoView: ProfileInfoView!
    
    
    let deleteBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "deleteBtn"), for: .normal)
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOffset = CGSize(width: 0, height: 6)
        btn.layer.shadowRadius = 10
        btn.layer.shadowOpacity = 0.8
        btn.addTarget(self, action: #selector(deleteButtonTapped(_:)), for: .touchUpInside)
        return btn
    }()
    
    let deleteBtnLabel: UILabel = {
        let label = UILabel()
        label.text = "DELETE THIS ACCOUNT"
        label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight(350))
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    override func viewDidLoad() {
        
        configureAppearance()
        setupViews()
        constrainViews()
    }
    
    
}

extension ProfileVC{
    func configureAppearance() {
//        let name = UserSettings.username ?? ""
//        let age = UserSettings.age ?? ""
//        let gender = UserSettings.gender ?? ""

        profileInfoView = ProfileInfoView()

        
        stackView.addArrangedSubview(NotificationView())
        stackView.addArrangedSubview(SettingBtnView(image: UIImage(named: "settingBlock")!, text: "Rate Us"))
        stackView.addArrangedSubview(SettingBtnView(image: UIImage(named: "settingBlock")!, text: "Leave Feetback"))
        stackView.addArrangedSubview(SettingBtnView(image: UIImage(named: "settingBlock")!, text: "Privacy Policy"))
        stackView.addArrangedSubview(SettingBtnView(image: UIImage(named: "settingBlock")!, text: "Terms Of Use"))
        //        stackView.addArrangedSubview(ProfileInfoView())
        //        stackView.addArrangedSubview(deleteBtn)
        //        for subview in stackView.subviews {
        //            print(subview)
        //        }
    }
    
    func setupViews() {
        setupView(titleLabel)
        setupView(stackView)
        setupView(profileInfoView)
        setupView(deleteBtn)
        setupView(deleteBtnLabel)
    }
    
    func constrainViews() {
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: -20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -10),
            
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -50),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50),
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -15),
            //                stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: 0),
            stackView.heightAnchor.constraint(equalToConstant: 360),
            
            
            profileInfoView.widthAnchor.constraint(equalToConstant: 330),
            profileInfoView.heightAnchor.constraint(equalToConstant: 200),
            profileInfoView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 0),
            profileInfoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            deleteBtn.topAnchor.constraint(equalTo: profileInfoView.bottomAnchor, constant: 10),
            deleteBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            deleteBtn.widthAnchor.constraint(equalToConstant: 180),
            deleteBtn.heightAnchor.constraint(equalToConstant: 60),
            
            deleteBtnLabel.centerYAnchor.constraint(equalTo: deleteBtn.centerYAnchor),
            deleteBtnLabel.centerXAnchor.constraint(equalTo: deleteBtn.centerXAnchor),
            deleteBtnLabel.leadingAnchor.constraint(equalTo: deleteBtn.leadingAnchor, constant: 15),
            deleteBtnLabel.topAnchor.constraint(equalTo: deleteBtn.topAnchor, constant: 0),
            deleteBtnLabel.widthAnchor.constraint(equalTo: deleteBtn.widthAnchor),
            deleteBtnLabel.heightAnchor.constraint(equalTo: deleteBtn.heightAnchor),
            
            view.heightAnchor.constraint(greaterThanOrEqualToConstant: 700),
            
        ])
    }
    
    func setupView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(view)
    }
    
    
    @objc func buttonTapped(_ sender: UIButton) {
//        ProfileView.transition(from: self, to: ProfileEditView(), duration: 0.5, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
        print("qwe")
    }
    
    
    @objc func deleteButtonTapped(_ sender: UIButton) {
        if let appDomain = Bundle.main.bundleIdentifier {
        IntroRegViewController.nameTextField = nil
            IntroRegViewController.ageTextField = nil
              UserDefaults.standard.removePersistentDomain(forName: appDomain)
              UserDefaults.standard.synchronize()
              print("All UserDefaults values removed.")
            let vc = PageController()
            navigationController?.pushViewController(vc, animated: true)
          }
    }
    
    
    func transitionVC() {
        let vc = ProfileEditVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}
