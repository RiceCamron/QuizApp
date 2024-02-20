//
//  StarView.swift
//  TestApp
//
//  Created by Artur Avdeev on 10.02.2024.
//

import UIKit

class StarView: UIView {
    
    let starImage: UIImageView = {
        let image = UIImage(named: "offStar")
        let view = UIImageView()
        view.image = image
        return view
    }()
    
   
    
    
    init(starImage: UIImage) {
        super.init(frame: .zero)
        
        self.starImage.image = starImage
        
        configureAppearance()
        setupViews()
        constrainViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension StarView {
    func configureAppearance() {
    }
    
    func setupViews() {
        setupView(starImage)
    }
    
    func constrainViews() {
        NSLayoutConstraint.activate([
            starImage.heightAnchor.constraint(equalToConstant: 40),
            starImage.widthAnchor.constraint(equalToConstant: 40),
            starImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            starImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10),
        ])
    }
    
    func setupView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
    }
}

