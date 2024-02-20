//
//  StudyTestVC.swift
//  TestApp
//
//  Created by Artur Avdeev on 09.02.2024.
//

import UIKit

class StudyTestVC: UIViewController {
    
    
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
        let backgroundImage = UIImage(named: "studyTestBg")
        let layer = CALayer()
        layer.contents = backgroundImage?.cgImage
        return layer
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "PLAYERS", attributes: [
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
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    var studyView: SelectSTView!
    var testView: SelectSTView!
    
    let backBtn = BackBtnView()
    
    
    override func viewDidLoad() {
        configureAppearance()
        setupViews()
        constrainViews()
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        configureAppearance()
        print("viewWillAppear")
        SelectionModel.selectedStudyTest = "STUDY"
        var studiesGet = SelectionModel.getSelectStudy(selectedSport: SelectionModel.selectedSport, selectedCategory: SelectionModel.selectedCategory, selectedStudyTest: SelectionModel.selectedStudyTest)
        
        let studyKey = SelectionModel.selectedSport + SelectionModel.selectedCategory + SelectionModel.selectedStudyTest
        
        var count = 0
        var uniqueStudyModels = Array(Set(QuizModel.savedStudyModels))
        
        var uniqueDoneStudyCount = uniqueStudyModels.filter { $0.isReadStudy && $0.studyForKey == studyKey }.count
        print(uniqueDoneStudyCount)
        studyView.doneQuestionsLabel.text = "\(uniqueDoneStudyCount)/\(studiesGet.count)"
        
        
        SelectionModel.selectedStudyTest = "TEST"
        
        var testsGet = SelectionModel.getSelectTest(selectedSport: SelectionModel.selectedSport, selectedCategory: SelectionModel.selectedCategory, selectedStudyTest: SelectionModel.selectedStudyTest)
        
        let testKey = SelectionModel.selectedSport + SelectionModel.selectedCategory + SelectionModel.selectedStudyTest
        
        var uniqueTestModels = Array(Set(QuizModel.savedTestModels))
        var uniqueDoneTestCount = uniqueTestModels.filter { $0.testForKey == testKey }.count
        testView.doneQuestionsLabel.text = "\(uniqueDoneTestCount)/\(studiesGet.count)"
    }
    
}

extension StudyTestVC{
    func configureAppearance() {
        gradientLayer.frame = view.bounds
        backgroundLayer.frame = CGRect(x: 50, y: 80, width: view.frame.width + -100, height: view.frame.height + -220)
        SelectionModel.selectedStudyTest = "STUDY"
        var studiesGet = SelectionModel.getSelectStudy(selectedSport: SelectionModel.selectedSport, selectedCategory: SelectionModel.selectedCategory, selectedStudyTest: SelectionModel.selectedStudyTest)
        
        let studyKey = SelectionModel.selectedSport + SelectionModel.selectedCategory + SelectionModel.selectedStudyTest
        
        var count = 0
        var uniqueStudyModels = Array(Set(QuizModel.savedStudyModels))
        
        var uniqueDoneStudyCount = uniqueStudyModels.filter { $0.isReadStudy && $0.studyForKey == studyKey }.count
        
        
        studyView = nil
        studyView = SelectSTView(imageBtn: UIImage(named: "studyBlock")!, titleText: "STUDY", doneQuistionsText: "\(uniqueDoneStudyCount)/\(studiesGet.count)")
        
        SelectionModel.selectedStudyTest = "TEST"
        var testsGet = SelectionModel.getSelectTest(selectedSport: SelectionModel.selectedSport, selectedCategory: SelectionModel.selectedCategory, selectedStudyTest: SelectionModel.selectedStudyTest)
        
        let testKey = SelectionModel.selectedSport + SelectionModel.selectedCategory + SelectionModel.selectedStudyTest
        
        var uniqueTestModels = Array(Set(QuizModel.savedTestModels))
        var uniqueDoneTestCount = uniqueTestModels.filter { $0.testForKey == testKey }.count
        
        testView = nil
        testView = SelectSTView(imageBtn: UIImage(named: "testBlock")!, titleText: "TEST", doneQuistionsText: "\(uniqueDoneTestCount)/\(testsGet.count/6)")
        
    }
    
    func setupViews() {
        view.layer.insertSublayer(gradientLayer, at: 0)
        view.layer.addSublayer(backgroundLayer)
        setupView(titleLabel)
        setupView(stackView)
        stackView.addArrangedSubview(studyView)
        stackView.addArrangedSubview(testView)
        setupView(backBtn)
    }
    
    func constrainViews() {
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: -20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -10),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 180),
            stackView.heightAnchor.constraint(equalToConstant: 450),
            
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
        
        if SelectionModel.selectedStudyTest == "STUDY" {
            let vc = StudyVC()
            vc.titleText = title
            navigationController?.pushViewController(vc, animated: true)
        } else if SelectionModel.selectedStudyTest == "TEST" {
            let vc = TestVC()
            vc.titleText = title
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

