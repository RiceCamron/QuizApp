//
//  StudyVC.swift
//  TestApp
//
//  Created by Artur Avdeev on 09.02.2024.
//

import UIKit

class StudyVC: UIViewController {

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

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .clear
        return scrollView
    }()

    var studies: [StudyBtnView] = []

    let backBtn = BackBtnView()

    override func viewDidLoad() {
        super.viewDidLoad()
//        SelectionModel.getJsonData()
        
        configureAppearance()
        setupViews()
        constrainViews()
        setupStudyViews()
    }

    func setupStudyViews() {
        var previousView: UIView?

        for study in studies {
            scrollView.addSubview(study)
            study.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                study.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
                study.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
                study.heightAnchor.constraint(equalToConstant: 90),
                study.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32),
            ])

            if let previous = previousView {
                study.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 16).isActive = true
            } else {
                study.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16).isActive = true
            }

            previousView = study
        }

        if let lastStudy = studies.last {
            scrollView.bottomAnchor.constraint(equalTo: lastStudy.bottomAnchor, constant: 16).isActive = true
        }
    }
}

extension StudyVC {
    func configureAppearance() {
        navigationController?.isNavigationBarHidden = true
        gradientLayer.frame = view.bounds

        backgroundLayer.frame = CGRect(x: 0, y: 90, width: view.frame.width + 0, height: view.frame.height + -260)
        
        let studiesGet = SelectionModel.getSelectStudy(selectedSport: SelectionModel.selectedSport, selectedCategory: SelectionModel.selectedCategory, selectedStudyTest: SelectionModel.selectedStudyTest)

        
        for study in studiesGet {
            print(study)
            
            if let image = UIImage(named: study.id % 2 != 0 ? "oddNumBlock" : "evenNumBlock") {
                print("Image found for study ID \(study.id)")
                studies.append(StudyBtnView(imageBtn: image, numberText: String(study.id), titleText: study.title, descText: study.desc))
            } else {
                // Handle the case when the image is not found (optional is nil)
                print("Error: Image not found for study ID \(study.id)")
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


    func transitionVC(with title: String, desc: String) {
        let vc = StudyDescVC()
        vc.titleText = title
        vc.descText = desc
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func saveCountStudy() {
        
    }
}
