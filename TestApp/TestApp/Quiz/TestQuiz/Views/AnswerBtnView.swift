//
//  AnswerBtnView.swift
//  TestApp
//
//  Created by Artur Avdeev on 09.02.2024.
//

import UIKit

class AnswerBtnView: UIView {
    
    let blockBtn: UIButton = {
        let btn = UIButton()
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOffset = CGSize(width: 0, height: 6)
        btn.layer.shadowRadius = 10
        btn.layer.shadowOpacity = 0.8
        btn.addTarget(self, action: #selector(TestQuizVC.answerButtonTapped(_:)), for: .touchUpInside)
        return btn
    }()
    
    let answerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Regular", size: 16)
        label.textColor = UIColor.white
        label.textAlignment = .left
        return label
    }()
    
    init(imageBtn: UIImage, titleText: String) {
        super.init(frame: .zero)
        
        blockBtn.setImage(imageBtn, for: .normal)
        answerLabel.text = titleText
        
        configureAppearance()
        setupViews()
        constrainViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AnswerBtnView{
    func configureAppearance() {
    }
    
    func setupViews() {
        setupView(blockBtn)
        setupView(answerLabel)
    }
    
    func constrainViews() {
        NSLayoutConstraint.activate([
            blockBtn.centerXAnchor.constraint(equalTo: centerXAnchor),
            blockBtn.widthAnchor.constraint(equalToConstant: 320),
            blockBtn.heightAnchor.constraint(equalToConstant: 60),
            
            answerLabel.centerYAnchor.constraint(equalTo: blockBtn.centerYAnchor, constant: 0),
            answerLabel.leadingAnchor.constraint(equalTo: blockBtn.leadingAnchor, constant: 20),
            
        ])
    }
    
    func setupView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
    }
    
    
    func updateAnswer(titleText: String, tag: Int) {
        answerLabel.text = titleText
        blockBtn.tag = tag
    }
    
}
