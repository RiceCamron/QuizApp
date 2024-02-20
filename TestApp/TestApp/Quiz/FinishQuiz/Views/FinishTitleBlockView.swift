//
//  FinishTitleBlock.swift
//  TestApp
//
//  Created by Artur Avdeev on 10.02.2024.
//

import UIKit

class FinishTitleBlockView: UIView {
    
    let finishTitleBlock: UIImageView = {
        let image = UIImage(named: "finishTitleBlock")
       let view = UIImageView()
        view.image = image
        view.contentMode = .scaleAspectFit
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 6)
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.8
        return view
    }()
    
    
    let titleBlockLabel: UILabel = {
        let label = UILabel()
        label.text = "YOU FINISH QUIZ"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "Inter-Regular", size: 26)
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        return label
    }()
    
    
    let descBlockLabel: UILabel = {
        let label = UILabel()
        label.text = "STATISTIC:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "Inter-Regular", size: 26)
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
    
}

extension FinishTitleBlockView{
    func configureAppearance() {
    }
    
    func setupViews() {
        setupView(finishTitleBlock)
        setupView(titleBlockLabel)
        setupView(descBlockLabel)
    }
    
    func constrainViews() {
        NSLayoutConstraint.activate([
            
            finishTitleBlock.widthAnchor.constraint(equalToConstant: 340),
            finishTitleBlock.heightAnchor.constraint(equalToConstant: 230),
            
            titleBlockLabel.centerXAnchor.constraint(equalTo: finishTitleBlock.centerXAnchor),
            titleBlockLabel.topAnchor.constraint(equalTo: finishTitleBlock.topAnchor, constant: 60),
            
            descBlockLabel.centerXAnchor.constraint(equalTo: titleBlockLabel.centerXAnchor),
            descBlockLabel.topAnchor.constraint(equalTo: titleBlockLabel.bottomAnchor, constant: 50),
        ])
    }
    
    func setupView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
    }
}

