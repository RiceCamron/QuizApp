//
//  QuestionQuizView.swift
//  TestApp
//
//  Created by Artur Avdeev on 09.02.2024.
//

import UIKit

class QuestionQuizView: UIView {
    
    let blockImage: UIImageView = {
        let image = UIImage(named: "questionBlock")
        let view = UIImageView()
        view.image = image
        view.contentMode = .scaleAspectFit
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 6)
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.8
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Regular", size: 24)
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = UIColor.white
        label.text = "Question"
        return label
    }()
    
    let questionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Regular", size: 16)
        label.textColor = UIColor.white
        label.numberOfLines = 0
        return label
    }()
    
    init(quiestionText: String) {
        super.init(frame: .zero)
        
        questionLabel.text = quiestionText
        
        configureAppearance()
        setupViews()
        constrainViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension QuestionQuizView{
    func configureAppearance() {
    }
    
    func setupViews() {
        setupView(blockImage)
        setupView(titleLabel)
        setupView(questionLabel)
    }
    
    func constrainViews() {
        NSLayoutConstraint.activate([
            
            blockImage.widthAnchor.constraint(equalToConstant: 300),
            blockImage.heightAnchor.constraint(equalToConstant: 200),
            
            titleLabel.topAnchor.constraint(equalTo: blockImage.topAnchor, constant: 45),
            titleLabel.leadingAnchor.constraint(equalTo: blockImage.leadingAnchor, constant: 20),
            questionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            questionLabel.leadingAnchor.constraint(equalTo: blockImage.leadingAnchor, constant: 20),
            questionLabel.trailingAnchor.constraint(equalTo: blockImage.trailingAnchor, constant: -20),
                 
        ])
    }
    
    func setupView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
    }
    
    func updateQuestion(question: String) {
        questionLabel.text = question
    }
}
