//
//  StudyDescView.swift
//  TestApp
//
//  Created by Artur Avdeev on 09.02.2024.
//

import UIKit

class StudyDescView: UIView {
    
    
    let blockImage: UIImageView = {
        let image = UIImage(named: "studyDescBlock")
        let view = UIImageView()
        view.image = image
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 6)
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.6
        return view
    }()
    
    
    
    let descTextView: UITextView = {
        let view = UITextView()
        view.font = UIFont(name: "Inter-Regular", size: 16)
        view.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        view.textColor = UIColor.white
        view.backgroundColor = .clear
        return view
    }()
    
    init(descText: String) {
        super.init(frame: .zero)
        
        descTextView.text = descText
        
        configureAppearance()
        setupViews()
        constrainViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StudyDescView {
    func configureAppearance() {
    }
    
    func setupViews() {
        setupView(blockImage)
        setupView(descTextView)
    }
    
    func constrainViews() {
        NSLayoutConstraint.activate([
            blockImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            blockImage.widthAnchor.constraint(equalToConstant: 320),
            blockImage.heightAnchor.constraint(equalToConstant: 600),
            blockImage.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            blockImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 150),
            blockImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            blockImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            
            descTextView.topAnchor.constraint(equalTo: blockImage.topAnchor, constant: 25),
            descTextView.leadingAnchor.constraint(equalTo: blockImage.leadingAnchor, constant: 20),
            descTextView.trailingAnchor.constraint(equalTo: blockImage.trailingAnchor, constant: -20),
            descTextView.bottomAnchor.constraint(equalTo: blockImage.bottomAnchor, constant: -10),
        ])
    }
    
    func setupView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
    }
    
}
