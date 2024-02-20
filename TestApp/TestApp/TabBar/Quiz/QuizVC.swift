//
//  QuizViewController.swift
//  TestApp
//
//  Created by Artur Avdeev on 04.02.2024.
//

import UIKit

class QuizVC: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "QUIZ", attributes: [
            .strokeColor: UIColor(hexString: "#CC8F25"),
            .foregroundColor: UIColor.clear,
            .strokeWidth: -2,
            .font: UIFont(name: "Inter-Regular", size: 78)!,
        ])
        return label
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    
    let footballItem = QuizItemView(image: UIImage(named: "footballBlock")!, titleText: "FOOTBALL", textAlign: .right)
    
    let basketballItem = QuizItemView(image: UIImage(named: "basketballBlock")!, titleText: "BASKETBALL", textAlign: .left)
    
    let mixedItem = QuizItemView(image: UIImage(named: "mixedBlock")!, titleText: "MIXED", textAlign: .center)
    
    override func viewDidLoad() {
        
        
        configureAppearance()
        setupViews()
        constrainViews()
    }
    
    
}

extension QuizVC{
    func configureAppearance() {
        stackView.addArrangedSubview(footballItem)
        stackView.addArrangedSubview(basketballItem)
        stackView.addArrangedSubview(mixedItem)
    }
    
    func setupViews() {
        setupView(titleLabel)
        setupView(stackView)
    }
    
    func constrainViews() {
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: -20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -10),
            
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            stackView.heightAnchor.constraint(equalToConstant: 620),

            
            
            footballItem.widthAnchor.constraint(equalToConstant: 340),
            footballItem.heightAnchor.constraint(equalToConstant: 190),
            
            basketballItem.widthAnchor.constraint(equalToConstant: 340),
            basketballItem.heightAnchor.constraint(equalToConstant: 190),
            
            mixedItem.widthAnchor.constraint(equalToConstant: 340),
            mixedItem.heightAnchor.constraint(equalToConstant: 190),
        ])
    }
    
    func setupView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(view)
    }
    
    func transitionVC(with title: String) {
        let vc = CategorySelectionVC()
        vc.titleText = title
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

