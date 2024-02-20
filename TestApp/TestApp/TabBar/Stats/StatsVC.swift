//
//  StatsView.swift
//  TestApp
//
//  Created by Artur Avdeev on 06.02.2024.
//


import UIKit

class StatsVC: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "STATISTICS", attributes: [
            .strokeColor: UIColor(hexString: "#CC8F25"),
            .foregroundColor: UIColor.clear,
            .strokeWidth: -2,
            .font: UIFont(name: "Inter-Regular", size: 74)!,
        ])
        return label
    }()
    
    let awardsBlock: UIImageView = {
        let image = UIImage(named: "awardsBlock")
        let view = UIImageView()
        view.image = image
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 6)
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.8
        return view
    }()
    
    let awardsScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    
    var awards: [AwardView]!
    
    var awardsStackView: UIStackView!
    
    let awardsContainerView = UIView()
    
    
    var statisticView = StatisticView()
    
    override func viewDidLoad() {
        
        configureAppearance()
        setupViews()
        constrainViews()

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Refresh awards array
        awards.removeAll()

        awards = [
            AwardView(image: UIImage(named: QuizModel.awards.contains("FOOTBALLPLAYERSTEST") ? "awardOn" : "awardOff")!, text: "Complete the soccer players quiz"),
            AwardView(image: UIImage(named: QuizModel.awards.contains("FOOTBALLCLUBSSTEST") ? "awardOn" : "awardOff")!, text: "Complete the football clubs quiz"),
            AwardView(image: UIImage(named: QuizModel.awards.contains("FOOTBALLRULESSTEST") ? "awardOn" : "awardOff")!, text: "Complete the soccer rules quiz"),
            AwardView(image: UIImage(named: QuizModel.awards.contains("BASKETBALLPLAYERSTEST") ? "awardOn" : "awardOff")!, text: "Complete the basketball players quiz"),
            AwardView(image: UIImage(named: QuizModel.awards.contains("BASKETBALLCLUBSTEST") ? "awardOn" : "awardOff")!, text: "Complete the basketball clubs quiz"),
            AwardView(image: UIImage(named: QuizModel.awards.contains("BASKETBALLRULESTEST") ? "awardOn" : "awardOff")!, text: "Complete the basketball rules quiz"),
        ]

        // Remove existing arrangedSubviews
        awardsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

        // Add refreshed awards to awardsStackView
        awards.forEach { award in
            awardsStackView.addArrangedSubview(award)
        }

        // Refresh contentSize based on the new awards count
        awardsScrollView.contentSize = CGSize(width: (awards.first!.frame.width + 10) * CGFloat(awards.count), height: awardsScrollView.frame.height)

        // Configure other appearance elements
        statisticView.configureAppearance()
    }
   

    
}

extension StatsVC{
    func configureAppearance() {
        awards = [
            AwardView(image: UIImage(named: QuizModel.awards.contains("FOOTBALLPLAYERSTEST") ? "awardOn" : "awardOff")!, text: "Complete the soccer players quiz"),
            AwardView(image: UIImage(named: QuizModel.awards.contains("FOOTBALLCLUBSSTEST") ? "awardOn" : "awardOff")!, text: "Complete the football clubs quiz"),
            AwardView(image: UIImage(named: QuizModel.awards.contains("FOOTBALLRULESSTEST") ? "awardOn" : "awardOff")!, text: "Complete the soccer rules quiz"),
            AwardView(image: UIImage(named: QuizModel.awards.contains("BASKETBALLPLAYERSTEST") ? "awardOn" : "awardOff")!, text: "Complete the basketball players quiz"),
            AwardView(image: UIImage(named: QuizModel.awards.contains("BASKETBALLCLUBSTEST") ? "awardOn" : "awardOff")!, text: "Complete the basketball clubs quiz"),
            AwardView(image: UIImage(named: QuizModel.awards.contains("BASKETBALLRULESTEST") ? "awardOn" : "awardOff")!, text: "Complete the basketball rules quiz"),
        ]

        
        awardsStackView = UIStackView(arrangedSubviews: awards)
        awardsStackView.axis = .horizontal
        awardsStackView.spacing = 10
        awardsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        awardsScrollView.contentSize = CGSize(width: (awards.first!.frame.width + 10) * CGFloat(awardsStackView.arrangedSubviews.count), height: awardsScrollView.frame.height)
        awardsScrollView.isPagingEnabled = false
    }
    
    func setupViews() {
        setupView(titleLabel)
        setupView(awardsBlock)
        setupView(awardsContainerView)
        awardsContainerView.addSubview(awardsScrollView)
        awardsScrollView.addSubview(awardsStackView)
        setupView(statisticView)
    }
    
    func constrainViews() {
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: -20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -10),
            
            awardsBlock.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            awardsBlock.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            awardsBlock.widthAnchor.constraint(equalToConstant: 340),
            awardsBlock.heightAnchor.constraint(equalToConstant: 190),
            
            awardsContainerView.topAnchor.constraint(equalTo: awardsBlock.topAnchor),
            awardsContainerView.leadingAnchor.constraint(equalTo: awardsBlock.leadingAnchor),
            awardsContainerView.trailingAnchor.constraint(equalTo: awardsBlock.trailingAnchor, constant: -7),
            awardsContainerView.bottomAnchor.constraint(equalTo: awardsBlock.bottomAnchor),
            
            awardsScrollView.centerYAnchor.constraint(equalTo: awardsBlock.centerYAnchor, constant: 0),
            awardsScrollView.leadingAnchor.constraint(equalTo: awardsBlock.leadingAnchor, constant: 10),
            awardsScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            awardsScrollView.bottomAnchor.constraint(equalTo: awardsBlock.bottomAnchor),
            awardsScrollView.heightAnchor.constraint(equalTo: awardsBlock.heightAnchor),

            
            awardsStackView.topAnchor.constraint(equalTo: awardsScrollView.topAnchor),
            awardsStackView.leadingAnchor.constraint(equalTo: awardsScrollView.leadingAnchor),
            awardsStackView.trailingAnchor.constraint(equalTo: awardsScrollView.trailingAnchor),
            awardsStackView.bottomAnchor.constraint(equalTo: awardsScrollView.bottomAnchor),
            awardsStackView.heightAnchor.constraint(equalTo: awardsScrollView.heightAnchor),
            awardsStackView.widthAnchor.constraint(equalTo: awardsScrollView.contentLayoutGuide.widthAnchor),
            
            statisticView.topAnchor.constraint(equalTo: awardsBlock.bottomAnchor, constant: 10),
            statisticView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
        awardsContainerView.clipsToBounds = true
    }
    
    func setupView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(view)
    }
    
}
