//
//  ResultsBlockView.swift
//  TestApp
//
//  Created by Artur Avdeev on 10.02.2024.
//


import UIKit

class ResultsBlockView: UIView {
    
    let resultsBlock: UIImageView = {
        let image = UIImage(named: "resultsBlock")
       let view = UIImageView()
        view.image = image
        view.contentMode = .scaleAspectFit
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 6)
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.8
        return view
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

extension ResultsBlockView {
    func configureAppearance() {
    }
    
    func setupViews() {
        setupView(resultsBlock)    }
    
    func constrainViews() {
        NSLayoutConstraint.activate([
            
            resultsBlock.widthAnchor.constraint(equalToConstant: 320),
            resultsBlock.heightAnchor.constraint(equalToConstant: 345),
            resultsBlock.centerXAnchor.constraint(equalTo: centerXAnchor),
            resultsBlock.topAnchor.constraint(equalTo: bottomAnchor, constant: 40),

        ])
    }
    
    func setupView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
    }
}

