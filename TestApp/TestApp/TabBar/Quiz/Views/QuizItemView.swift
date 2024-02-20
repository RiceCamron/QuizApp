//
//  QuizItemView.swift
//  TestApp
//
//  Created by Artur Avdeev on 05.02.2024.
//

enum TextAlign {
    case left
    case center
    case right
}
import UIKit

class QuizItemView: UIView {
    
    let blockBtn: UIButton = {
        let btn = UIButton()
        
        btn.contentMode = .scaleAspectFit
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
    
    
    
    init(image: UIImage, titleText: String, textAlign: TextAlign) {
        super.init(frame: .zero)
        
        // Adjust the frame of blockBtn based on textAlign
            switch textAlign {
            case .left:
                blockBtn.frame = CGRect(x: 0, y: 0, width: 340, height: 230)
                titleLabel.frame = CGRect(x: 30, y: 70, width: 200, height: 20)

            case .center:
                blockBtn.frame = CGRect(x: 0, y: 0, width: 340, height: 230)
                titleLabel.frame = CGRect(x: 120, y: 70, width: 200, height: 20)

            case .right:
                blockBtn.frame = CGRect(x: 0, y: 0, width: 340, height: 230)
                titleLabel.frame = CGRect(x: 180, y: 100, width: 200, height: 20)
            }
        
        self.blockBtn.setImage(image, for: .normal)
        self.titleLabel.text = titleText
        configureAppearance()
        setupViews()
        constrainViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension QuizItemView{
    func configureAppearance() {
    }
    
    func setupViews() {
        setupView(blockBtn)
        blockBtn.addSubview(titleLabel)
    }
    
    func constrainViews() {
        NSLayoutConstraint.activate([
            
            blockBtn.widthAnchor.constraint(equalToConstant: 340),
            blockBtn.heightAnchor.constraint(equalToConstant: 230),
            
//            titleLabel.centerXAnchor.constraint(equalTo: blockBtn.centerXAnchor),
//                     titleLabel.centerYAnchor.constraint(equalTo: blockBtn.centerYAnchor),
                 
        ])
    }
    
    func setupView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
    }
    
    
    @objc func buttonTapped(_ sender: UIButton) {
        
        SelectionModel.selectedSport = titleLabel.text!
        print("asd")
        if let viewController = findViewController() as? QuizVC {
            viewController.transitionVC(with: SelectionModel.selectedSport ?? "")
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

