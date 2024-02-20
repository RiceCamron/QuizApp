//
//  TestBtnView.swift
//  TestApp
//
//  Created by Artur Avdeev on 11.02.2024.
//

import UIKit

class TestBtnView: UIView {
    
    let blockBtn: UIButton = {
        let btn = UIButton()
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOffset = CGSize(width: 0, height: 6)
        btn.layer.shadowRadius = 10
        btn.layer.shadowOpacity = 0.6
        btn.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        return btn
    }()
    
    let container = UIView()
    
    let numberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Regular", size: 30)
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
    
    let countComplitedQLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Regular", size: 24)
        label.textColor = UIColor.white
        return label
    }()
    
    var countComplitedQ: String!
    var testDatas: [TestData] = []
    
    var filterDatas: [TestData] = []
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    init(imageBtn: UIImage, numberText: String, testDatas: [TestData], countComplitedQ: String) {
        super.init(frame: .zero)
        
        blockBtn.setImage(imageBtn, for: .normal)
        numberLabel.text = numberText
        self.countComplitedQ = countComplitedQ
        countComplitedQLabel.text = "\(self.countComplitedQ!)/6"
        self.testDatas = testDatas
//        print("TestDatas testbtnview\(testDatas)")
        for test in testDatas {
            if numberText == String(test.study_id) {
                filterDatas.append(test)
            }
        }
        
        configureAppearance()
        setupViews()
        constrainViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TestBtnView{
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
        setupView(countComplitedQLabel)
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
            
            
            countComplitedQLabel.bottomAnchor.constraint(equalTo: blockBtn.bottomAnchor, constant: -40),
            countComplitedQLabel.leadingAnchor.constraint(equalTo: blockBtn.leadingAnchor, constant: 30),
        ])
        
        container.clipsToBounds = true
        container.isUserInteractionEnabled = false
    }
    
    func setupView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
    }
    
    
    func updateTestData(testDatas: [TestData], countComplitedQ: String) {
        self.testDatas = testDatas
        self.filterDatas = testDatas.filter { $0.study_id == Int(numberLabel.text ?? "") ?? 0 }
        self.countComplitedQ = countComplitedQ
        self.countComplitedQLabel.text = "\(self.countComplitedQ!)/6"
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        print("asd")
        if let viewController = findViewController() as? TestVC {
            viewController.transitionVC(testDatas: self.testDatas, filterDatas: self.filterDatas, study_id: Int(numberLabel.text ?? "") ?? 0)
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
