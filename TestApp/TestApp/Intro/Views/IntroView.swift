//
//  IntroView.swift
//  TestApp
//
//  Created by Artur Avdeev on 02.02.2024.
//

import UIKit

class IntroView: UIView {
    let blurTitleView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .regular)
        let view = UIVisualEffectView()
        view.layer.cornerRadius = 10
        view.effect = blurEffect
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let introTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        return label
    }()

    let blurDescView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .regular)
        let view = UIVisualEffectView()
        view.layer.cornerRadius = 10
        view.effect = blurEffect
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let introDescLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        constrainViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        constrainViews()
    }

    private func setupViews() {
        blurTitleView.contentView.addSubview(introTitleLabel)
        blurDescView.contentView.addSubview(introDescLabel)
        addSubview(blurTitleView)
        addSubview(blurDescView)
    }

    private func constrainViews() {
                NSLayoutConstraint.activate([
                    blurTitleView.topAnchor.constraint(equalTo: topAnchor, constant: 50),
                    blurTitleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
                    blurTitleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
                    blurTitleView.heightAnchor.constraint(equalToConstant: 70),
                    blurTitleView.widthAnchor.constraint(equalToConstant: 10),
        
                    introTitleLabel.centerXAnchor.constraint(equalTo: blurTitleView.centerXAnchor),
                    introTitleLabel.centerYAnchor.constraint(equalTo: blurTitleView.centerYAnchor),
                    introTitleLabel.widthAnchor.constraint(equalToConstant: frame.width - 100),
        
                    blurDescView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -200),
                    blurDescView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
                    blurDescView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
                    blurDescView.heightAnchor.constraint(equalToConstant: 100),
                    blurDescView.widthAnchor.constraint(equalToConstant: 100),
        
                    introDescLabel.centerXAnchor.constraint(equalTo: blurDescView.centerXAnchor),
                    introDescLabel.centerYAnchor.constraint(equalTo: blurDescView.centerYAnchor),
                    introDescLabel.widthAnchor.constraint(equalToConstant: frame.width - 100),
                    introDescLabel.topAnchor.constraint(equalTo: blurDescView.topAnchor, constant: 10),
                ])
    }

    func setData(_ data: IntroData) {
            introTitleLabel.text = data.title
            introDescLabel.text = data.description
        }
}
