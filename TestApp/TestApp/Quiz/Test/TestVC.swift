//
//  TestVC.swift
//  TestApp
//
//  Created by Artur Avdeev on 11.02.2024.
//

import UIKit

class TestVC: UIViewController {
    
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
        let backgroundImage = UIImage(named: "testBg")
        let layer = CALayer()
        layer.contents = backgroundImage?.cgImage
        return layer
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "TEST", attributes: [
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
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .clear
        return scrollView
    }()
    
    var tests: [TestBtnView] = []
    
    let backBtn = BackBtnView()
    
    var testDatas: [TestData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(testDatas)
        configureAppearance()
        setupViews()
        constrainViews()
        setupTestViews()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        testDatas.removeAll()
        tests.removeAll()
        configureAppearance()
        setupTestViews()
    }
    
    func setupTestViews() {
        var previousView: UIView?
        
        for test in tests {
            scrollView.addSubview(test)
            test.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                test.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
                test.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
                test.heightAnchor.constraint(equalToConstant: 90),
                test.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32),
            ])
            
            if let previous = previousView {
                test.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 16).isActive = true
            } else {
                test.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16).isActive = true
            }
            
            previousView = test
        }
        
        if let lastStudy = tests.last {
            scrollView.bottomAnchor.constraint(equalTo: lastStudy.bottomAnchor, constant: 16).isActive = true
        }
    }
}

extension TestVC {
//    func configureAppearance() {
//        navigationController?.isNavigationBarHidden = true
//        gradientLayer.frame = view.bounds
//        
//        backgroundLayer.frame = CGRect(x: -25, y: 90, width: view.frame.width + 0, height: view.frame.height + -260)
//        
//        let testsGet = SelectionModel.getSelectTest(selectedSport: SelectionModel.selectedSport, selectedCategory: SelectionModel.selectedCategory, selectedStudyTest: SelectionModel.selectedStudyTest)
//        
//        
//        
//        var i: Int = 1
//        for test in testsGet {
//            if test.study_id == i {
//                testDatas.append(test)
//                if testDatas.count % 6 == 0 {
//                    // If testDatas contains 6 elements, create a new TestBtnView
//                    if let image = UIImage(named: i % 2 != 0 ? "oddNumBlock" : "evenNumBlock") {
//                        print("Image found for test ID \(i)")
//                        tests.append(TestBtnView(imageBtn: image, numberText: String(i), testDatas: testDatas, countComplitedQ: "0"))
//                        i += 1
//                    } else {
//                        print("Error: Image not found for test ID \(i)")
//                    }
//                }
//            }
//        }
//        print("TESTDATASSSS: \(testDatas)")
//        print("#########################################")
//    }
    func configureAppearance() {
        navigationController?.isNavigationBarHidden = true
        gradientLayer.frame = view.bounds
        
        backgroundLayer.frame = CGRect(x: -25, y: 90, width: view.frame.width + 0, height: view.frame.height + -260)
        
        let testsGet = SelectionModel.getSelectTest(selectedSport: SelectionModel.selectedSport, selectedCategory: SelectionModel.selectedCategory, selectedStudyTest: SelectionModel.selectedStudyTest)
        
        let testKey = SelectionModel.selectedSport + SelectionModel.selectedCategory + SelectionModel.selectedStudyTest
        
        var i: Int = 1
        for test in testsGet {
            if test.study_id == i {
                testDatas.append(test)
                if testDatas.count % 6 == 0 {
                    // If testDatas contains 6 elements, create a new TestBtnView
                    if let image = UIImage(named: i % 2 != 0 ? "oddNumBlock" : "evenNumBlock") {
                        print("Image found for test ID \(i)")
                        
                        // Calculate study_id using QuizModel
                        let study_id = QuizModel.savedStudyModels.count + 1
                        let studyKey = testDatas.first?.study_id ?? 0
                        let correctAnswers = QuizModel.savedTestModels
                            .filter { $0.testForKey == testKey && $0.study_id == i }
                            .first?
                            .correctAnswers ?? 0
                        
                        tests.append(TestBtnView(imageBtn: image, numberText: String(i), testDatas: testDatas, countComplitedQ: "\(correctAnswers)"))
                        i += 1
                    } else {
                        print("Error: Image not found for test ID \(i)")
                    }
                }
            }
        }

    }

    
    func setupViews() {
        view.layer.insertSublayer(gradientLayer, at: 0)
        view.layer.addSublayer(backgroundLayer)
        setupView(scrollView)
        setupView(titleLabel)
        //        stackView.addArrangedSubview(studies)
        setupView(backBtn)
    }
    
    func constrainViews() {
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: -20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -10),
            
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            
            
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
    
    
    func transitionVC(testDatas: [TestData], filterDatas: [TestData], study_id: Int) {
        let vc = TestQuizVC()
        vc.testDatas = self.testDatas
        vc.filterDatas = filterDatas
        vc.study_id = study_id
        navigationController?.pushViewController(vc, animated: true)
    }
}
