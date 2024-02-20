//
//  NotificationView.swift
//  TestApp
//
//  Created by Artur Avdeev on 07.02.2024.
//

import UIKit

class NotificationView: UIView {
    
    let notificationView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "settingBlock")
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 6)
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.8
        return view
    }()
    
    let notificationLabel: UILabel = {
        let label = UILabel()
        label.text = "Notifications"
        label.textColor = .white
        label.font = UIFont(name: "Inter-Regular", size: 24)
        return label
    }()
    let notificationSwitch: UISwitch = {
        let switch1 = UISwitch()
        switch1.tintColor = UIColor(hexString: "#CC8F25")
        switch1.onTintColor = UIColor(hexString: "#CC8F25")
        switch1.thumbTintColor = UIColor.white
        switch1.isOn = true
        switch1.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)

        return switch1
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
    
}

extension NotificationView{
    func configureAppearance() {
    }
    
    func setupViews() {
        setupView(notificationView)
        setupView(notificationLabel)
        setupView(notificationSwitch)
    }
    
    func constrainViews() {
        NSLayoutConstraint.activate([
            notificationView.centerXAnchor.constraint(equalTo: centerXAnchor),
            notificationView.widthAnchor.constraint(equalToConstant: 300),
            notificationView.heightAnchor.constraint(equalToConstant: 60),
            
            notificationLabel.centerYAnchor.constraint(equalTo: notificationView.centerYAnchor),
            notificationLabel.leadingAnchor.constraint(equalTo: notificationView.leadingAnchor, constant: 20),
            
            notificationSwitch.centerYAnchor.constraint(equalTo: notificationView.centerYAnchor),
            notificationSwitch.trailingAnchor.constraint(equalTo: notificationView.trailingAnchor, constant: -20),
            notificationSwitch.heightAnchor.constraint(equalToConstant: 30),
//            notificationSwitch.widthAnchor.constraint(equalToConstant: 30),
            
        ])
    }
    
    func setupView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
    }
    
    
    @objc func switchValueChanged(_ sender: UISwitch) {
      if sender.isOn {
        // Do something when the switch is on
        print("Notifications are enabled!")
      } else {
        // Do something when the switch is off
        print("Notifications are disabled.")
      }
    }
}
