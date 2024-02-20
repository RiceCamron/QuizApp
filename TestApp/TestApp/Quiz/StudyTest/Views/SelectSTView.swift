//
//  SelectSTView.swift
//  TestApp
//
//  Created by Artur Avdeev on 09.02.2024.
//


import UIKit

class SelectSTView: UIView {
    
    var blockBtn: UIButton = {
        let btn = UIButton()
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOffset = CGSize(width: 0, height: 6)
        btn.layer.shadowRadius = 10
        btn.layer.shadowOpacity = 0.8
        btn.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        return btn
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Regular", size: 30)
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textColor = UIColor.white
        return label
    }()
    
    var doneQuestionsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Regular", size: 22)
        label.textColor = UIColor.white
        return label
    }()
    
    init(imageBtn: UIImage, titleText: String, doneQuistionsText: String) {
        super.init(frame: .zero)
        print(doneQuistionsText)
        
        blockBtn.setImage(imageBtn, for: .normal)
        titleLabel.text = titleText
        self.doneQuestionsLabel.text = doneQuistionsText
        
        configureAppearance()
        setupViews()
        constrainViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SelectSTView{
    func configureAppearance() {
    }
    
    func setupViews() {
        setupView(blockBtn)
        setupView(titleLabel)
        setupView(doneQuestionsLabel)
    }
    
    func constrainViews() {
        NSLayoutConstraint.activate([
            blockBtn.centerXAnchor.constraint(equalTo: centerXAnchor),
            blockBtn.widthAnchor.constraint(equalToConstant: 320),
            blockBtn.heightAnchor.constraint(equalToConstant: 180),
            
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            titleLabel.trailingAnchor.constraint(equalTo: blockBtn.trailingAnchor, constant: -30),
            
            doneQuestionsLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -53),
            doneQuestionsLabel.leadingAnchor.constraint(equalTo: blockBtn.leadingAnchor, constant: 30),
        ])
    }
    
    func setupView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
    }
    
    
    func updateDoneQuestionsText(_ newText: String) {
        doneQuestionsLabel.text = newText
    }

    
    @objc func buttonTapped(_ sender: UIButton) {
        SelectionModel.selectedStudyTest = titleLabel.text!
        print("asd")
        if let viewController = findViewController() as? StudyTestVC {
            viewController.transitionVC(with: SelectionModel.selectedStudyTest ?? "")
            }
    }

    private func findViewController() -> UIViewController? {
        var responder: UIResponder? = self
        while let nextResponder = responder?.next {
            responder = nextResponder
            if let viewController = responder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}
