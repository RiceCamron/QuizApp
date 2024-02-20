//
//  BackButton.swift
//  TestApp
//
//  Created by Artur Avdeev on 08.02.2024.
//

import UIKit

class BackBtnView: UIView {
        
        let blockBtn: UIButton = {
            let image = UIImage(named: "backBtnBlock")
            let btn = UIButton()
            btn.setImage(image, for: .normal)
            btn.layer.shadowColor = UIColor.black.cgColor
            btn.layer.shadowOffset = CGSize(width: 0, height: 6)
            btn.layer.shadowRadius = 10
            btn.layer.shadowOpacity = 0.8
            btn.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            return btn
        }()
        
        let iconBtn: UIImageView = {
            let image = UIImage(named: "arrowLeft")
            let view = UIImageView()
            view.image = image
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

    extension BackBtnView{
        func configureAppearance() {
        }
        
        func setupViews() {
            setupView(blockBtn)
            setupView(iconBtn)
        }
        
        func constrainViews() {
            NSLayoutConstraint.activate([
                blockBtn.widthAnchor.constraint(equalToConstant: 60),
                blockBtn.heightAnchor.constraint(equalToConstant: 60),
                
                iconBtn.centerXAnchor.constraint(equalTo: blockBtn.centerXAnchor),
                iconBtn.centerYAnchor.constraint(equalTo: blockBtn.centerYAnchor),
                
                iconBtn.widthAnchor.constraint(equalToConstant: 20),
                iconBtn.heightAnchor.constraint(equalToConstant: 35),
            ])
        }
        
        func setupView(_ view: UIView) {
            view.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(view)
        }
        
        @objc func buttonTapped(_ sender: UIButton) {
            print(sender)
            if let viewController = findViewController() {
                 if let navigationController = viewController.navigationController {
                     navigationController.popViewController(animated: true)
                 } else {
                     viewController.dismiss(animated: true, completion: nil)
                 }
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
