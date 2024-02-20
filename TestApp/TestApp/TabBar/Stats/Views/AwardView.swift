//
//  AwardView.swift
//  TestApp
//
//  Created by Artur Avdeev on 06.02.2024.
//

import UIKit

final class AwardView: UIView {
    let imageView: UIImageView = {
        let image = UIImage(named: "awardOff")
        let view = UIImageView()
        view.image = image
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let titleText: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Regular", size: 12)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    init(image: UIImage, text: String) {
        super.init(frame: .zero)
        self.imageView.image = image
        self.titleText.text = text
        
        addSubview(imageView)
        addSubview(self.titleText)
        
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -25),
            imageView.widthAnchor.constraint(equalToConstant: 80),
            imageView.heightAnchor.constraint(equalToConstant: 90),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            
            titleText.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            titleText.widthAnchor.constraint(equalToConstant: 90),
        ])
    }
}
