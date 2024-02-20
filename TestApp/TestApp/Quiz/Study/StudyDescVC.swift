//
//  StudyDescVC.swift
//  TestApp
//
//  Created by Artur Avdeev on 09.02.2024.
//

import UIKit

class StudyDescVC: UIViewController {
    
    let gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [
            UIColor(hexString: "393A3A").cgColor,
            UIColor(hexString: "1C1E22").cgColor,
            UIColor(hexString: "101114").cgColor,
        ]
        layer.locations = [0.0, 0.5, 1.0]
        return layer
    }()
    
    let backgroundLayer: CALayer = {
        let backgroundImage = UIImage(named: "quizViewBg")
        let layer = CALayer()
        layer.contents = backgroundImage?.cgImage
        return layer
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "STUDY", attributes: [
            .strokeColor: UIColor(hexString: "#CC8F25"),
            .foregroundColor: UIColor.clear,
            .strokeWidth: -2,
            .font: UIFont(name: "Inter-Regular", size: 78)!,
        ])
        return label
    }()
    
    
    var titleText: String = "" {
        didSet {
            titleLabel.attributedText = NSAttributedString(string: titleText, attributes: [
                .strokeColor: UIColor(hexString: "#CC8F25"),
                .foregroundColor: UIColor.clear,
                .strokeWidth: -2,
                .font: UIFont(name: "Inter-Regular", size: 78)!,
            ])
        }
    }
    
    var descText: String = ""
    
    var studyDescView: StudyDescView!
    
    let backBtn = BackBtnView()
    
    override func viewDidLoad() {
        configureAppearance()
        setupViews()
        constrainViews()
    }
    
    
}

extension StudyDescVC{
    func configureAppearance() {
        gradientLayer.frame = view.bounds
        
        titleLabel.text = titleText
        
        studyDescView = StudyDescView(descText: descText)
        
        backgroundLayer.frame = CGRect(x: 0, y: 90, width: view.frame.width + 0, height: view.frame.height + -260)
    }
    
    func setupViews() {
        view.layer.insertSublayer(gradientLayer, at: 0)
        view.layer.addSublayer(backgroundLayer)
        setupView(titleLabel)
        setupView(backBtn)
        setupView(studyDescView)
    }
    
    func constrainViews() {
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: -20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -10),
            
            studyDescView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            studyDescView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            
                backBtn.widthAnchor.constraint(equalToConstant: 60),
            backBtn.heightAnchor.constraint(equalToConstant: 60),
            backBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            backBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
        ])
    }
    
    func setupView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(view)
    }
    
    
    func transitionVC(with title: String) {
        let vc = StudyTestVC()
        vc.titleText = title
        navigationController?.pushViewController(vc, animated: true)
    }
}

