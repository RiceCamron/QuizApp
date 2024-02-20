//
//  StatisticView.swift
//  TestApp
//
//  Created by Artur Avdeev on 10.02.2024.
//

import UIKit

class StatisticView: UIView {
    
    let statisticBlock: UIImageView = {
        let image = UIImage(named: "statisticBlock")
        let view = UIImageView()
        view.image = image
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 6)
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.8
        return view
    }()
    
    let titleStats: UILabel = {
        let label = UILabel()
        label.text = "STATISTIC"
        label.textColor = .white
        label.font = UIFont(name: "Inter-Regular", size: 20)
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    let countStats: UILabel = {
        let label = UILabel()
        label.text = "NUMBER OF COMPLETED QUESTIONS: 24"
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont(name: "Inter-Regular", size: 18)
        return label
    }()
    
    let sliceValues: [CGFloat] = [0.8, 0.2]
    let sliceColors = [UIColor(hexString: "#1D6019"), UIColor(hexString: "#9A0D1D")]
    var pieChartView: PieChartView!
    
    let rightAnsImg: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "rightAns")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let rightAnsLabel: UILabel = {
        let label = UILabel()
        label.text = "RIGHT ANSWERS"
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont(name: "Inter-Regular", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let rightCountLabel: UILabel = {
        let label = UILabel()
        label.text = "19"
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont(name: "Inter-Regular", size: 16)
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let rightPrecLabel: UILabel = {
        let label = UILabel()
        label.text = "80%"
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont(name: "Inter-Regular", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let wrongAnsImg: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "wrongAns")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let wrongAnsLabel: UILabel = {
        let label = UILabel()
        label.text = "WRONG ANSWERS"
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont(name: "Inter-Regular", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let wrongCountLabel: UILabel = {
        let label = UILabel()
        label.text = "5"
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont(name: "Inter-Regular", size: 16)
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let wrongPrecLabel: UILabel = {
        let label = UILabel()
        label.text = "20%"
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont(name: "Inter-Regular", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let blurPieChartView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterialDark)
        let view = UIVisualEffectView()
        view.layer.cornerRadius = 100
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(hexString: "#1affffff").cgColor
        view.effect = blurEffect
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    
    init() {
        super.init(frame: .zero)
        
        pieChartView = PieChartView(sliceValues: sliceValues, sliceColors: sliceColors)
        
        configureAppearance()
        setupViews()
        constrainViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension StatisticView{
    func configureAppearance() {
        let numberOfCompletedQuestions = QuizModel.getNumberOfCompletedQuestions()
        let numberOfRightAnswers = QuizModel.getNumberOfRightAnswers()
        let numberOfWrongAnswers = QuizModel.getNumberOfWrongAnswers()

        countStats.text = "NUMBER OF COMPLETED QUESTIONS: \(numberOfCompletedQuestions)"
        rightCountLabel.text = "\(numberOfRightAnswers)"
        wrongCountLabel.text = "\(numberOfWrongAnswers)"

        // Рассчитываем проценты
        let totalQuestions = numberOfRightAnswers + numberOfWrongAnswers
        let rightPercentage = totalQuestions == 0 ? 0 : (CGFloat(numberOfRightAnswers) / CGFloat(totalQuestions)) * 100
        let wrongPercentage = totalQuestions == 0 ? 0 : (CGFloat(numberOfWrongAnswers) / CGFloat(totalQuestions)) * 100

        rightPrecLabel.text = "\(Int(rightPercentage))%"
        wrongPrecLabel.text = "\(Int(wrongPercentage))%"

        // Передаем значения в PieChartView
        pieChartView.sliceValues = [rightPercentage / 100, wrongPercentage / 100]
        pieChartView.setNeedsDisplay()
    }

    
    func setupViews() {
        setupView(statisticBlock)
        setupView(titleStats)
        setupView(countStats)
        statisticBlock.addSubview(blurPieChartView)
        setupView(pieChartView)
        statisticBlock.addSubview(rightAnsImg)
        statisticBlock.addSubview(rightAnsLabel)
        statisticBlock.addSubview(rightCountLabel)
        statisticBlock.addSubview(rightPrecLabel)
        statisticBlock.addSubview(wrongAnsImg)
        statisticBlock.addSubview(wrongAnsLabel)
        statisticBlock.addSubview(wrongCountLabel)
        statisticBlock.addSubview(wrongPrecLabel)
    }
    
    func constrainViews() {
        NSLayoutConstraint.activate([
            
            statisticBlock.heightAnchor.constraint(equalToConstant: 360),
            statisticBlock.widthAnchor.constraint(equalToConstant: 340),
            statisticBlock.centerXAnchor.constraint(equalTo: centerXAnchor),
            statisticBlock.topAnchor.constraint(equalTo: bottomAnchor, constant: 30),
            
            titleStats.topAnchor.constraint(equalTo: statisticBlock.topAnchor, constant: 30),
            titleStats.leadingAnchor.constraint(equalTo: statisticBlock.leadingAnchor, constant: 30),
            
            countStats.topAnchor.constraint(equalTo: titleStats.bottomAnchor, constant: 10),
            countStats.leadingAnchor.constraint(equalTo: statisticBlock.leadingAnchor, constant: 30),
            countStats.widthAnchor.constraint(equalToConstant: 250),
            
            blurPieChartView.heightAnchor.constraint(equalToConstant: 200),
            blurPieChartView.widthAnchor.constraint(equalToConstant: 200),
            blurPieChartView.centerXAnchor.constraint(equalTo: pieChartView.centerXAnchor),
            blurPieChartView.centerYAnchor.constraint(equalTo: pieChartView.centerYAnchor),
//            blurPieChartView.bottomAnchor.constraint(equalTo: statisticBlock.bottomAnchor, constant: -30),
//            blurPieChartView.leadingAnchor.constraint(equalTo: statisticBlock.leadingAnchor, constant: 20),
            
            pieChartView.topAnchor.constraint(equalTo: countStats.bottomAnchor, constant: 30),
               pieChartView.leadingAnchor.constraint(equalTo: statisticBlock.leadingAnchor, constant: -70),
               pieChartView.trailingAnchor.constraint(equalTo: statisticBlock.trailingAnchor, constant: -30),
               pieChartView.heightAnchor.constraint(equalToConstant: 190),
            
            
                rightAnsImg.topAnchor.constraint(equalTo: statisticBlock.topAnchor, constant: 150),
                rightAnsImg.leadingAnchor.constraint(equalTo: statisticBlock.leadingAnchor, constant: 200),
                rightAnsImg.widthAnchor.constraint(equalToConstant: 10),
                rightAnsImg.heightAnchor.constraint(equalToConstant: 10),

                rightAnsLabel.topAnchor.constraint(equalTo: statisticBlock.topAnchor, constant: 140),
                rightAnsLabel.leadingAnchor.constraint(equalTo: rightAnsImg.trailingAnchor, constant: 20),
                rightAnsLabel.widthAnchor.constraint(equalToConstant: 100),
                rightAnsLabel.heightAnchor.constraint(equalToConstant: 40),
            
                rightCountLabel.topAnchor.constraint(equalTo: statisticBlock.topAnchor, constant: 170),
                rightCountLabel.leadingAnchor.constraint(equalTo: rightAnsImg.trailingAnchor, constant: 20),
                rightCountLabel.widthAnchor.constraint(equalToConstant: 100),
                rightCountLabel.heightAnchor.constraint(equalToConstant: 40),
            
                rightPrecLabel.topAnchor.constraint(equalTo: statisticBlock.topAnchor, constant: 170),
                rightPrecLabel.leadingAnchor.constraint(equalTo: rightCountLabel.trailingAnchor, constant: -50),
                rightPrecLabel.widthAnchor.constraint(equalToConstant: 100),
                rightPrecLabel.heightAnchor.constraint(equalToConstant: 40),
            
                wrongAnsImg.topAnchor.constraint(equalTo: statisticBlock.topAnchor, constant: 305),
                wrongAnsImg.leadingAnchor.constraint(equalTo: statisticBlock.leadingAnchor, constant: 200),
                wrongAnsImg.widthAnchor.constraint(equalToConstant: 10),
                wrongAnsImg.heightAnchor.constraint(equalToConstant: 10),
            
                wrongAnsLabel.topAnchor.constraint(equalTo: statisticBlock.topAnchor, constant: 300),
                wrongAnsLabel.leadingAnchor.constraint(equalTo: wrongAnsImg.trailingAnchor, constant: 20),
                wrongAnsLabel.widthAnchor.constraint(equalToConstant: 100),
                wrongAnsLabel.heightAnchor.constraint(equalToConstant: 40),
            
                wrongCountLabel.topAnchor.constraint(equalTo: statisticBlock.topAnchor, constant: 270),
                wrongCountLabel.leadingAnchor.constraint(equalTo: wrongAnsImg.trailingAnchor, constant: 20),
                wrongCountLabel.widthAnchor.constraint(equalToConstant: 100),
                wrongCountLabel.heightAnchor.constraint(equalToConstant: 40),
            
                wrongPrecLabel.topAnchor.constraint(equalTo: statisticBlock.topAnchor, constant: 270),
                wrongPrecLabel.leadingAnchor.constraint(equalTo: wrongCountLabel.trailingAnchor, constant: -50),
                wrongPrecLabel.widthAnchor.constraint(equalToConstant: 100),
                wrongPrecLabel.heightAnchor.constraint(equalToConstant: 40),
             
        ])
    }
    
    func setupView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
    }
}
