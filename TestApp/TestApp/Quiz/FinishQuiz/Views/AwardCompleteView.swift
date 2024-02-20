//
//  AwardCompleteView.swift
//  TestApp
//
//  Created by Artur Avdeev on 16.02.2024.
//

import UIKit

class AwardCompleteView: UIView {
    
    let blurTitleView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .regular)
        let view = UIVisualEffectView()
        view.layer.cornerRadius = 10
        view.effect = blurEffect
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont(name: "Inter-Regular", size: 22)
        label.text = "Achievement completed!"
        return label
    }()
    
    let completeImage: UIImageView = {
        let image = UIImage(named: "completedIcon")
        let view = UIImageView()
        view.image = image
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        constrainViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        setupView(blurTitleView)
        setupView(titleLabel)
        setupView(completeImage)
    }

    private func constrainViews() {
                NSLayoutConstraint.activate([
                    
                                blurTitleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
                                blurTitleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
                                blurTitleView.heightAnchor.constraint(equalToConstant: 70),
                                blurTitleView.widthAnchor.constraint(equalToConstant: 110),
                    
                                titleLabel.leadingAnchor.constraint(equalTo: blurTitleView.leadingAnchor, constant: 20),
                                titleLabel.centerYAnchor.constraint(equalTo: blurTitleView.centerYAnchor),
                                titleLabel.widthAnchor.constraint(equalToConstant: 140),
                                
                                completeImage.trailingAnchor.constraint(equalTo: blurTitleView.trailingAnchor, constant: -10),
                                completeImage.bottomAnchor.constraint(equalTo: blurTitleView.bottomAnchor, constant: -10),
                    completeImage.heightAnchor.constraint(equalToConstant: 25),
                    completeImage.widthAnchor.constraint(equalToConstant: 30),
                ])
    }
    
    func setupView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
    }
    
}
