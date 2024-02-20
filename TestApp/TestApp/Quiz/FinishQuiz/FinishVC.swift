//
//  FinishVC.swift
//  TestApp
//
//  Created by Artur Avdeev on 10.02.2024.
//

import UIKit

class FinishVC: UIViewController {
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
        let backgroundImage = UIImage(named: "finishBg")
        let layer = CALayer()
        layer.contents = backgroundImage?.cgImage
        return layer
    }()
    
    let blurTitleView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .regular)
        let view = UIVisualEffectView()
        view.layer.cornerRadius = 10
        view.effect = blurEffect
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let awardTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.text = "Achievement completed!"
        return label
    }()
    
    let completeImage: UIImageView = {
        let image = UIImage(named: "completedIcon")
        let view = UIImageView()
        view.image = image
        return view
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
    
    let finishTitleBlock = FinishTitleBlockView()
    let resultsBlockView = ResultsBlockView()
    
    var gradesStackView: UIStackView!
    var starsStackView: UIStackView!
    
    let gradeNumViews: [GradeNumView] = [
        GradeNumView(number: "1"),
        GradeNumView(number: "2"),
        GradeNumView(number: "3"),
        GradeNumView(number: "4"),
        GradeNumView(number: "5"),
        GradeNumView(number: "6"),
    ]
    
    let starViews: [StarView] = [
        StarView(starImage: UIImage(named: "offStar")!),
        StarView(starImage: UIImage(named: "offStar")!),
        StarView(starImage: UIImage(named: "offStar")!),
        StarView(starImage: UIImage(named: "offStar")!),
        StarView(starImage: UIImage(named: "offStar")!),
    ]
    
    let gradeTitle: UILabel = {
        let label = UILabel()
        label.text = "Questions"
        label.font = UIFont(name: "Inter-Regular", size: 14)
        label.textColor = .white
        return label
    }()
    
    
    
    var progressBar: ProgressBarView!
    
    var percent: Int = 0
    
    var score: Int!
    var wrongQuistionIndex: [Int] = []
    
    var study_id: Int = 0
    
    let progressBarTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Regular", size: 14)
        label.textColor = .white
        return label
    }()
    
    let restartBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "restartBtnBlock"), for: .normal)
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOffset = CGSize(width: 0, height: 6)
        btn.layer.shadowRadius = 10
        btn.layer.shadowOpacity = 0.8
        btn.addTarget(self, action: #selector(restartButtonTapped), for: .touchUpInside)
        return btn
    }()
    let nextBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "nextBtnBlock"), for: .normal)
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOffset = CGSize(width: 0, height: 6)
        btn.layer.shadowRadius = 10
        btn.layer.shadowOpacity = 0.8
        btn.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    let restartBtnLabel: UILabel = {
        let label = UILabel()
        label.text = "RESTART"
        label.font = UIFont(name: "Inter-Regular", size: 26)
        label.font = UIFont.systemFont(ofSize: 26, weight: UIFont.Weight(350))
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    let nextBtnLabel: UILabel = {
        let label = UILabel()
        label.text = "NEXT"
        label.font = UIFont(name: "Inter-Regular", size: 26)
        label.font = UIFont.systemFont(ofSize: 26, weight: UIFont.Weight(350))
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let awardCompView = AwardCompleteView()
    
    var restartButtonAction: (() -> Void)?
    var nextButtonAction: (() -> Void)?
    
    var testDatas: [TestData] = []
    
    var quizDatas: [TestData] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        setupViews()
        constrainViews()
        
        updateResults()
        saveTestModel()
        
        checkAndAddAwards()
        print("$#!$#!$@#!$@")
        print(testDatas)
    }
    
}

extension FinishVC {
    func configureAppearance() {
        gradientLayer.frame = view.bounds
        
        self.awardCompView.isHidden = true
        
        progressBarTitle.text = "Section completed: \(percent)%"
        
        backgroundLayer.frame = CGRect(x: 0, y: 80, width: view.frame.width + 30, height: view.frame.height + -300)
        
        
        gradesStackView = UIStackView(arrangedSubviews: gradeNumViews)
        gradesStackView.axis = .horizontal
        gradesStackView.spacing = 25
        gradesStackView.translatesAutoresizingMaskIntoConstraints = false
        
        starsStackView = UIStackView(arrangedSubviews: starViews)
        starsStackView.axis = .horizontal
        starsStackView.spacing = 12
        starsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        percent = score * 100 / 6
        progressBar = ProgressBarView(percent: CGFloat(percent))
        
    }
    
    func setupViews() {
        view.layer.insertSublayer(gradientLayer, at: 0)
        view.layer.addSublayer(backgroundLayer)
        
        setupView(titleLabel)
        setupView(finishTitleBlock)
        setupView(resultsBlockView)
        setupView(gradesStackView)
        setupView(gradeTitle)
        setupView(progressBar)
        setupView(progressBarTitle)
        setupView(starsStackView)
        setupView(restartBtn)
        setupView(nextBtn)
        setupView(restartBtnLabel)
        setupView(nextBtnLabel)
        setupView(awardCompView)
    }
    
    func constrainViews() {
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: -20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -10),
            
            finishTitleBlock.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            finishTitleBlock.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            finishTitleBlock.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            finishTitleBlock.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            resultsBlockView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultsBlockView.topAnchor.constraint(equalTo: finishTitleBlock.bottomAnchor, constant: 200),
            
            gradesStackView.topAnchor.constraint(equalTo: resultsBlockView.topAnchor, constant: 100),
            gradesStackView.leadingAnchor.constraint(equalTo: resultsBlockView.leadingAnchor, constant: -10),
            gradesStackView.trailingAnchor.constraint(equalTo: resultsBlockView.trailingAnchor, constant: 0),
            gradesStackView.widthAnchor.constraint(equalToConstant: 240),
            
            gradeTitle.topAnchor.constraint(equalTo: gradesStackView.bottomAnchor, constant: 45),
            gradeTitle.leadingAnchor.constraint(equalTo: progressBar.leadingAnchor, constant: 0),
            
            progressBar.topAnchor.constraint(equalTo: gradesStackView.bottomAnchor, constant: 110),
            progressBar.leadingAnchor.constraint(equalTo: resultsBlockView.leadingAnchor, constant: -5),
            
            progressBarTitle.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 18),
            progressBarTitle.leadingAnchor.constraint(equalTo: progressBar.leadingAnchor, constant: 0),
            
            
            starsStackView.topAnchor.constraint(equalTo: progressBarTitle.bottomAnchor, constant: 40),
            starsStackView.leadingAnchor.constraint(equalTo: gradesStackView.leadingAnchor, constant: -10),
            starsStackView.trailingAnchor.constraint(equalTo: gradesStackView.trailingAnchor, constant: 0),
            starsStackView.widthAnchor.constraint(equalToConstant: 240),
            
            restartBtn.heightAnchor.constraint(equalToConstant: 55),
            restartBtn.widthAnchor.constraint(equalToConstant: 160),
            restartBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            restartBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            
            nextBtn.heightAnchor.constraint(equalToConstant: 55),
            nextBtn.widthAnchor.constraint(equalToConstant: 160),
            nextBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            nextBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            
            restartBtnLabel.centerXAnchor.constraint(equalTo: restartBtn.centerXAnchor),
            restartBtnLabel.centerYAnchor.constraint(equalTo: restartBtn.centerYAnchor),
            
            nextBtnLabel.centerXAnchor.constraint(equalTo: nextBtn.centerXAnchor),
            nextBtnLabel.centerYAnchor.constraint(equalTo: nextBtn.centerYAnchor),
            
            awardCompView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            awardCompView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            awardCompView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            awardCompView.heightAnchor.constraint(equalToConstant: 70),
            awardCompView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -80),
        ])
    }
    
    func setupView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(view)
    }
    
    
    func updateResults() {
        // Update gradeNumViews
        for (index, gradeNumView) in gradeNumViews.enumerated() {
            if wrongQuistionIndex.contains(index) {
                gradeNumView.lineView.backgroundColor = UIColor(hexString: "#E62A40")
            } else {
                gradeNumView.lineView.backgroundColor = UIColor(hexString: "#4DB547")
            }
        }
        
        // Update starsStackView based on the score
        for (index, starView) in starsStackView.arrangedSubviews.enumerated() {
            if index < score {
                if let starView = starView as? StarView {
                    starView.starImage.image = UIImage(named: "onStar")!
                }
            } else {
                if let starView = starView as? StarView {
                    starView.starImage.image = UIImage(named: "offStar")!
                }
            }
        }
        
        progressBarTitle.text = "Section completed: \(percent)%"
    }
    
    func saveTestModel() {
        let testKey = SelectionModel.selectedSport + SelectionModel.selectedCategory + SelectionModel.selectedStudyTest
        
        // Создайте новый объект TestModel для сохранения
        let newTestModel = QuizModel.TestModel(
            study_id: study_id,  // Укажите нужное значение study_id
            testForKey: testKey,
            correctAnswers: score,  // Индексы правильных ответов
            wrongAnswers: wrongQuistionIndex.count  // Индексы неправильных ответов
        )
        
        // Удалите существующий объект TestModel с таким study_id и testForKey (если он существует)
        QuizModel.savedTestModels = QuizModel.savedTestModels.filter { $0.testForKey != testKey || $0.study_id != study_id }
        
        // Добавьте новый объект TestModel
        var existingTestModels = QuizModel.savedTestModels
        existingTestModels.append(newTestModel)
        QuizModel.savedTestModels = existingTestModels
        
        print(QuizModel.savedTestModels)
    }
    
    
    @objc func restartButtonTapped() {
        restartButtonAction?()
    }
    
    @objc func nextButtonTapped() {
        // Check if the current study_id is the last one in testDatas
        if testDatas.last?.study_id == self.study_id {
            // If it is the last one, navigate back to TestVC
            navigateBackToTestVC()
        } else {
            // If not the last one, proceed with the existing logic
            nextButtonAction?()
        }
    }
    
    func navigateBackToTestVC() {
        // You can use navigationController to pop to the desired view controller
        for viewController in navigationController?.viewControllers ?? [] {
            if let testVC = viewController as? TestVC {
                navigationController?.popToViewController(testVC, animated: true)
                return
            }
        }
        
        // If TestVC is not found in the navigation stack, you can push a new instance
        let testVC = TestVC()
        navigationController?.pushViewController(testVC, animated: true)
    }
    
    func checkAndAddAwards() {
        print("$$$$$$$$$$$$$$$$$$$$$$$$$$")
        let testKey = SelectionModel.selectedSport + SelectionModel.selectedCategory + SelectionModel.selectedStudyTest
        
        // Get all test models for the current category
        let testsForCategory = QuizModel.savedTestModels.filter { $0.testForKey == testKey }
        
        var sum: Int = 0
        var allTestsCompleted: Bool = false
        for quiz in QuizModel.savedTestModels {
            sum += quiz.correctAnswers
        }
        
        if sum == testDatas.count {
            allTestsCompleted = true
        }
        
        // Check if the award is not already added
        let awardAlreadyAdded = QuizModel.awards.contains(testKey)
        
        // Add the award if all tests are completed and the award is not already added
        if allTestsCompleted && !awardAlreadyAdded {
            QuizModel.addAward(testKey)
            showAwardNotification()
        }
        
        print("#####################################")
        print(QuizModel.awards)
    }
    func showAwardNotification() {
        awardCompView.isHidden = false
        UIView.animate(withDuration: 0.5, animations: {
            // Set the initial position off the screen
            self.awardCompView.transform = CGAffineTransform(translationX: 0, y: -self.awardCompView.bounds.height)
        }) { (_) in
            // Animation completion block
            UIView.animate(withDuration: 0.5, delay: 2.0, options: .curveEaseInOut, animations: {
                // Move the awardCompView back to its original position
                self.awardCompView.transform = .identity
            }, completion: nil)
        }
    }
    
}
