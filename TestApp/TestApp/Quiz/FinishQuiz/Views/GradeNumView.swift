//
//  GradeNumView.swift
//  TestApp
//
//  Created by Artur Avdeev on 10.02.2024.
//

import UIKit

enum lineColors {
    case green
    case red
}

class GradeNumView: UIView {
    
    let numLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "Inter-Regular", size: 26)
        return label
    }()
    
    let lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hexString: "#E62A40")
        view.heightAnchor.constraint(equalToConstant: 3).isActive = true
        view.layer.cornerRadius = 2
        return view
    }()
    
    
    
    
    init(number: String) {
        super.init(frame: .zero)
        
        numLabel.text = number
//        switch lineColor {
//        case .green: lineView.backgroundColor = UIColor(hexString: "#4DB547")
//        case .red: lineView.backgroundColor = UIColor(hexString: "#E62A40")
//        }
        
        configureAppearance()
        setupViews()
        constrainViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension GradeNumView {
    func configureAppearance() {
    }
    
    func setupViews() {
        setupView(numLabel)
        setupView(lineView)
    }
    
    func constrainViews() {
        NSLayoutConstraint.activate([
            numLabel.widthAnchor.constraint(equalToConstant: 20),
            numLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            numLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            numLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10),
            
            lineView.topAnchor.constraint(equalTo: numLabel.bottomAnchor, constant: 5),
            lineView.widthAnchor.constraint(equalToConstant: 30),
            lineView.centerXAnchor.constraint(equalTo: numLabel.centerXAnchor),
        ])
    }
    
    func setupView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
    }
}

