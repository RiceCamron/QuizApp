//
//  SettingBtnView.swift
//  TestApp
//
//  Created by Artur Avdeev on 06.02.2024.
//

import UIKit

class SettingBtnView: UIView {
    
    let settingButton: UIButton = {
        let btn = UIButton()
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOffset = CGSize(width: 0, height: 6)
        btn.layer.shadowRadius = 10
        btn.layer.shadowOpacity = 0.8
        btn.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        return btn
    }()
    
    let settingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Inter-Regular", size: 24)
        return label
    }()
    let settingArrowImg: UIImageView = {
        let image = UIImage(named: "arrowRight")
        let view = UIImageView()
        view.image = image
        return view
    }()
    
    init(image: UIImage, text: String) {
        super.init(frame: .zero)
        
        settingButton.setImage(image, for: .normal)
        settingLabel.text = text
        configureAppearance()
        setupViews()
        constrainViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SettingBtnView{
    func configureAppearance() {
    }
    
    func setupViews() {
        setupView(settingButton)
        setupView(settingLabel)
        setupView(settingArrowImg)
    }
    
    func constrainViews() {
        NSLayoutConstraint.activate([
            settingButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            settingButton.widthAnchor.constraint(equalToConstant: 300),
            settingButton.heightAnchor.constraint(equalToConstant: 60),
            
            settingLabel.centerYAnchor.constraint(equalTo: settingButton.centerYAnchor),
            settingLabel.leadingAnchor.constraint(equalTo: settingButton.leadingAnchor, constant: 20),
            
            settingArrowImg.centerYAnchor.constraint(equalTo: settingButton.centerYAnchor),
            settingArrowImg.trailingAnchor.constraint(equalTo: settingButton.trailingAnchor, constant: -20),
            settingArrowImg.heightAnchor.constraint(equalToConstant: 30),
            settingArrowImg.widthAnchor.constraint(equalToConstant: 18),
            
        ])
    }
    
    func setupView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
    }
    
    @objc func buttonTapped(_ sender: UIButton) {       }
}
