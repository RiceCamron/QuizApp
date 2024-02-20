//
//  StudyBtn.swift
//  TestApp
//
//  Created by Artur Avdeev on 09.02.2024.
//

import UIKit

class StudyBtnView: UIView {
    
    let blockBtn: UIButton = {
        let btn = UIButton()
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOffset = CGSize(width: 0, height: 6)
        btn.layer.shadowRadius = 30
        btn.layer.shadowOpacity = 0.6
        btn.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        return btn
    }()
    
    let container = UIView()
    
    let numberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Regular", size: 24)
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textColor = UIColor.white
        return label
    }()
    
    let numberBgLabel1: UILabel = {
        let label = UILabel()

        label.text = "1"
        label.font = UIFont(name: "Inter-Regular", size: 124)
        label.font = UIFont.systemFont(ofSize: 124, weight: .bold)
                    label.textColor = UIColor(hexString: "#1affffff")
        label.textAlignment = .right
        return label
    }()
    
    let numberBgLabel2: UILabel = {
        let label = UILabel()

        label.text = "1"
        label.font = UIFont(name: "Inter-Regular", size: 204)
        label.font = UIFont.systemFont(ofSize: 204, weight: .bold)
        label.textColor = UIColor(hexString: "#1affffff")
        label.contentMode = .left
        return label
    }()
    
    var titleText: String!
    var descText: String!
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    init(imageBtn: UIImage, numberText: String, titleText: String, descText: String) {
        super.init(frame: .zero)
        
        blockBtn.setImage(imageBtn, for: .normal)
        numberLabel.text = numberText
        self.titleText = titleText
        self.descText = descText
        
        configureAppearance()
        setupViews()
        constrainViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StudyBtnView{
    func configureAppearance() {
        numberBgLabel1.text = numberLabel.text
        numberBgLabel2.text = numberLabel.text
        
        
    }
    
    func setupViews() {
        setupView(blockBtn)
        setupView(numberBgLabel1)
        setupView(numberBgLabel2)
        setupView(container)
        container.addSubview(numberBgLabel1)
        container.addSubview(numberBgLabel2)
        setupView(numberLabel)
    }
    
    func constrainViews() {
        NSLayoutConstraint.activate([
            blockBtn.centerXAnchor.constraint(equalTo: centerXAnchor),
            blockBtn.widthAnchor.constraint(equalToConstant: 320),
            blockBtn.heightAnchor.constraint(equalToConstant: 100),
            
            container.heightAnchor.constraint(equalTo: blockBtn.heightAnchor),
            container.widthAnchor.constraint(equalTo: blockBtn.widthAnchor),
            container.leadingAnchor.constraint(equalTo: blockBtn.leadingAnchor, constant: 0),
            
            numberLabel.centerYAnchor.constraint(equalTo: blockBtn.centerYAnchor, constant: 20),
            numberLabel.trailingAnchor.constraint(equalTo: blockBtn.trailingAnchor, constant: -30),
            
                        numberBgLabel1.leadingAnchor.constraint(equalTo: blockBtn.leadingAnchor, constant: -100),
                        numberBgLabel1.topAnchor.constraint(equalTo: blockBtn.topAnchor, constant: -8),
            numberBgLabel1.widthAnchor.constraint(equalToConstant: 200),
            
                        numberBgLabel2.trailingAnchor.constraint(equalTo: blockBtn.trailingAnchor, constant: 80),
                        numberBgLabel2.topAnchor.constraint(equalTo: blockBtn.topAnchor, constant: -42),
            numberBgLabel2.widthAnchor.constraint(equalToConstant: 240),
            
//            numberBgLabel1.leadingAnchor.constraint(equalTo: blockBtn.leadingAnchor),
//            numberBgLabel1.topAnchor.constraint(equalTo: blockBtn.topAnchor),
//            numberBgLabel1.trailingAnchor.constraint(equalTo: blockBtn.trailingAnchor),
//            numberBgLabel1.bottomAnchor.constraint(equalTo: blockBtn.bottomAnchor),
        ])
        
        container.clipsToBounds = true
        container.isUserInteractionEnabled = false
    }
    
    func setupView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
    }
    @objc func buttonTapped(_ sender: UIButton) {
        print(numberLabel.text ?? "")
        
        let studyKey = SelectionModel.selectedSport + SelectionModel.selectedCategory + SelectionModel.selectedStudyTest
        
        // Проверка наличия studyKey в массиве existingStudyModels
        if !QuizModel.savedStudyModels.contains(where: { $0.studyForKey == studyKey && $0.id == Int(numberLabel.text ?? "") }) {
            let newStudyModel = QuizModel.StudyModel(id: (Int(numberLabel.text ?? "") ?? 0), studyForKey: studyKey, isReadStudy: true)
            var existingStudyModels = QuizModel.savedStudyModels
            existingStudyModels.append(newStudyModel)
            QuizModel.savedStudyModels = existingStudyModels
            
        } else {
            print("StudyModel with studyForKey \(studyKey) already exists.")
        }
        print("asd")
        if let viewController = findViewController() as? StudyVC {
            viewController.transitionVC(with: titleText ?? "", desc: descText ?? "")
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
