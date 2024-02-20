//
//  SelectTypeView.swift
//  TestApp
//
//  Created by Artur Avdeev on 08.02.2024.
//

import UIKit

class SelectTypeView: UIView {
    
    let blockBtn: UIButton = {
        let btn = UIButton()
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOffset = CGSize(width: 0, height: 6)
        btn.layer.shadowRadius = 10
        btn.layer.shadowOpacity = 0.8
        btn.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        return btn
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Regular", size: 26)
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        label.textColor = UIColor.white
        return label
    }()
    
    init(imageBtn: UIImage, titleText: String) {
        super.init(frame: .zero)
        
        blockBtn.setImage(imageBtn, for: .normal)
        titleLabel.text = titleText
        
        configureAppearance()
        setupViews()
        constrainViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SelectTypeView{
    func configureAppearance() {
    }
    
    func setupViews() {
        setupView(blockBtn)
        setupView(titleLabel)
    }
    
    func constrainViews() {
        NSLayoutConstraint.activate([
            blockBtn.centerXAnchor.constraint(equalTo: centerXAnchor),
            blockBtn.widthAnchor.constraint(equalToConstant: 320),
            blockBtn.heightAnchor.constraint(equalToConstant: 180),
            
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            titleLabel.trailingAnchor.constraint(equalTo: blockBtn.trailingAnchor, constant: -30),
        ])
    }
    
    func setupView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        SelectionModel.selectedCategory = titleLabel.text!
        if let viewController = findViewController() as? CategorySelectionVC {
            viewController.transitionVC(with: SelectionModel.selectedCategory ?? "")
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
