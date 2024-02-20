//
//  TestQuizVC.swift
//  TestApp
//
//  Created by Artur Avdeev on 09.02.2024.
//

import UIKit

class TestQuizVC: UIViewController {
    
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
        let backgroundImage = UIImage(named: "testQuizBg")
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
    
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    var testDatas: [TestData]!
    
    var questionQuiz: QuestionQuizView!
    
    var answer1: AnswerBtnView!
    var answer2: AnswerBtnView!
    var answer3: AnswerBtnView!
    var answer4: AnswerBtnView!
    
    
    var currentQuestionIndex = 0
    var score = 0
    var wrongQuistionIndex: [Int] = []
    var study_id: Int = 0
    
    var timer: Int = 5
    var timerView: TimerView!
    
    let backBtn = BackBtnView()
    
    
    var filterDatas: [TestData] = []
    var quizDatas: [TestData] = []
    
    let questDoneLabel: UILabel = {
            let label = UILabel()
            label.attributedText = NSAttributedString(string: "0/6", attributes: [
//                .strokeColor: UIColor.clear,
                .foregroundColor: UIColor.lightGray,
                .strokeWidth: -2,
                .font: UIFont(name: "Inter-Regular", size: 20)!,
            ])
            return label
    }()
    
    
    override func viewDidLoad() {
        configureAppearance()
        setupViews()
        constrainViews()
        updateUIForCurrentQuestion()
    }
    
}

extension TestQuizVC{
    func configureAppearance() {
        timerView = TimerView(timer: timer)
        
        gradientLayer.frame = view.bounds
        
        backgroundLayer.frame = CGRect(x: 0, y: 70, width: view.frame.width + -20, height: view.frame.height + -550)
        
        questionQuiz = QuestionQuizView(quiestionText: testDatas[0].question)
        print("testDaatas: \(testDatas)")
        for test in filterDatas {
            if String(study_id) == String(test.study_id) {
                quizDatas.append(test)
            }
        }
        
        answer1 = AnswerBtnView(imageBtn: UIImage(named: "answerBlock1")!, titleText: quizDatas[0].answers[0].answer)
        answer2 = AnswerBtnView(imageBtn: UIImage(named: "answerBlock2")!, titleText: quizDatas[0].answers[1].answer)
        answer3 = AnswerBtnView(imageBtn: UIImage(named: "answerBlock3")!, titleText: quizDatas[0].answers[2].answer)
        answer4 = AnswerBtnView(imageBtn: UIImage(named: "answerBlock4")!, titleText: quizDatas[0].answers[3].answer)
        
    }
    
    func setupViews() {
        view.layer.insertSublayer(gradientLayer, at: 0)
        view.layer.addSublayer(backgroundLayer)
        setupView(titleLabel)
        setupView(stackView)
        stackView.addArrangedSubview(answer1)
        stackView.addArrangedSubview(answer2)
        stackView.addArrangedSubview(answer3)
        stackView.addArrangedSubview(answer4)
        setupView(questionQuiz)
        setupView(backBtn)
        setupView(questDoneLabel)
        setupView(timerView)
    }
    
    func constrainViews() {
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: -20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -10),
            
            questionQuiz.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            questionQuiz.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            questionQuiz.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 40),
            
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            stackView.topAnchor.constraint(equalTo: questionQuiz.bottomAnchor, constant: 230),
            stackView.heightAnchor.constraint(equalToConstant: 350),
            
            
                backBtn.widthAnchor.constraint(equalToConstant: 60),
            backBtn.heightAnchor.constraint(equalToConstant: 60),
            backBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            backBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            questDoneLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -95),
            questDoneLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            timerView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -20),
            timerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -140),
            ])
    }
    
    func setupView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(view)
    }
    
    
    @objc func answerButtonTapped(_ sender: UIButton) {
        let selectedAnswer = quizDatas[currentQuestionIndex].answers[sender.tag].answer

        if selectedAnswer == quizDatas[currentQuestionIndex].correctAnswer {
            score += 1
        } else if selectedAnswer != quizDatas[currentQuestionIndex].correctAnswer {
            wrongQuistionIndex.append(currentQuestionIndex)
        }

        currentQuestionIndex += 1

        if currentQuestionIndex < quizDatas.count {
            updateUIForCurrentQuestion()
        } else {
            print("Quiz completed! Score: \(score)")
            print("Wrongs \(wrongQuistionIndex)")
            
            showFinishVC(timer: timerView.countdownTimer!, circleProgressView: TimerView(timer: timer).circleProgressView)
        }
    }
    
    
    
    
    func showFinishVC(timer: Timer, circleProgressView: CircleProgressView) {
        
        circleProgressView.animateCircle(duration: TimeInterval(self.timer), delay: 0)

        timer.invalidate()
            for index in currentQuestionIndex..<quizDatas.count {
                        wrongQuistionIndex.append(index)
                    }
        let finishVC = FinishVC()
         finishVC.score = score
         finishVC.wrongQuistionIndex = wrongQuistionIndex
        finishVC.study_id = study_id
        finishVC.testDatas = self.testDatas
        
        finishVC.restartButtonAction = { [weak self] in
            self?.restartQuiz()
        }
        
        finishVC.nextButtonAction = { [weak self] in
            self?.nextQuiz()
        }
        
            
         
         navigationController?.pushViewController(finishVC, animated: true)
     }
    
    func restartQuiz() {
        timerView.timer = timer
        navigationController?.popViewController(animated: true)
        timerView.startTimer()
        
         currentQuestionIndex = 0
         score = 0
         wrongQuistionIndex.removeAll()
         updateUIForCurrentQuestion()
     }
    
    func nextQuiz() {
        study_id += 1
        timerView.timer = timer
        navigationController?.popViewController(animated: true)
        timerView.startTimer()
        
        currentQuestionIndex = 0
        score = 0

        quizDatas.removeAll()

        for test in testDatas {
            print(test)
            if String(study_id) == String(test.study_id) {
                self.quizDatas.append(test)
            }
        }

        print("quizDatas: \(self.quizDatas)")

        wrongQuistionIndex.removeAll()

        nextUIForCurrentQuestion()
    }

    
    func updateUIForCurrentQuestion() {
        
        let currentQuestion = quizDatas[currentQuestionIndex]
        questionQuiz.updateQuestion(question: currentQuestion.question)
        answer1.updateAnswer(titleText: currentQuestion.answers[0].answer, tag: 0)
        answer2.updateAnswer(titleText: currentQuestion.answers[1].answer, tag: 1)
        answer3.updateAnswer(titleText: currentQuestion.answers[2].answer, tag: 2)
        answer4.updateAnswer(titleText: currentQuestion.answers[3].answer, tag: 3)

        
        questDoneLabel.text = "\(currentQuestionIndex + 1)/\(quizDatas.count)"
    }
    
    func nextUIForCurrentQuestion() {
        
        let currentQuestion = quizDatas[currentQuestionIndex]
        questionQuiz.updateQuestion(question: currentQuestion.question)
        answer1.updateAnswer(titleText: currentQuestion.answers[0].answer, tag: 0)
        answer2.updateAnswer(titleText: currentQuestion.answers[1].answer, tag: 1)
        answer3.updateAnswer(titleText: currentQuestion.answers[2].answer, tag: 2)
        answer4.updateAnswer(titleText: currentQuestion.answers[3].answer, tag: 3)

        
        questDoneLabel.text = "\(currentQuestionIndex + 1)/\(quizDatas.count)"
    }
    
    func nextTestUpdate() {
        let testsGet = SelectionModel.getSelectTest(selectedSport: SelectionModel.selectedSport, selectedCategory: SelectionModel.selectedCategory, selectedStudyTest: SelectionModel.selectedStudyTest)

        let testKey = SelectionModel.selectedSport + SelectionModel.selectedCategory + SelectionModel.selectedStudyTest

        var i: Int = 1
        for test in testsGet {
            if test.study_id == i {
                quizDatas.append(test)
            }
        }
    }

}

