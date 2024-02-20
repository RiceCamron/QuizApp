//
//  PageController.swift
//  TestApp
//
//  Created by Artur Avdeev on 01.02.2024.
//

import UIKit

class PageController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    private lazy var pages: [UIViewController] = {
        let firstPage = IntroViewController()
        let secondPage = IntroViewController()
        let thirdPage = IntroRegViewController()
        
        let introData1 = IntroModel.shared.getData(forIndex: 0)
        let introData2 = IntroModel.shared.getData(forIndex: 1)
        let introData3 = IntroModel.shared.getData(forIndex: 2)
        
        (firstPage as? IntroViewController)?.setData(introData1)
        (secondPage as? IntroViewController)?.setData(introData2)
        (thirdPage as? IntroRegViewController)?.setData(introData3)
        
        return [firstPage, secondPage, thirdPage]
    }()
    
    private lazy var pageControl: FilledPageControl = {
        let pageControl = FilledPageControl()
        pageControl.pageCount = pages.count
        pageControl.progress = 0
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.inactiveRingWidth = 1
        pageControl.indicatorPadding = 10
        pageControl.indicatorRadius = 5
        pageControl.tintColor = UIColor.lightGray
        return pageControl
    }()
    
    let nextButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "nextBtn1"), for: .normal)
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOffset = CGSize(width: 0, height: 6)
        btn.layer.shadowRadius = 10
        btn.layer.shadowOpacity = 0.8
        btn.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    let nextBtnLabel: UILabel = {
        let label = UILabel()
        label.text = "NEXT"
        label.font = UIFont.systemFont(ofSize: 38, weight: UIFont.Weight(350))
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    var isRegDataNotEmpty = false
    
    var tapGesture: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        configureAppearance()
        setupViews()
        constrainViews()
    }
    private func setupViews() {
        setupView(pageControl)
        setupView(nextButton)
        setupView(nextBtnLabel)
        view.addGestureRecognizer(tapGesture)
    }
    private func constrainViews() {
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -120),
            
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 180),
            nextButton.widthAnchor.constraint(equalToConstant: 180),
            nextButton.heightAnchor.constraint(equalToConstant: 60),
            
            nextBtnLabel.centerYAnchor.constraint(equalTo: nextButton.centerYAnchor),
            nextBtnLabel.centerXAnchor.constraint(equalTo: nextButton.centerXAnchor),
        ])
    }
    
    private func setupView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(view)
    }
    
    private func configureAppearance() {
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        dataSource = self
        delegate = self
        
        setViewControllers([pages.first!], direction: .forward, animated: false, completion: nil)
        
        
    }
    
    
    @objc private func nextButtonTapped() {
        
        if let currentViewController = viewControllers?.first as? IntroViewController,
           let currentIndex = pages.firstIndex(of: currentViewController),
           currentIndex < pages.count - 1 {
            
            
            let nextIndex = currentIndex + 1
            let nextViewController = pages[nextIndex]
            
            if let introViewController = nextViewController as? IntroViewController {
                let introData = IntroModel.shared.getData(forIndex: nextIndex)
                introViewController.setData(introData)
            } else if let introRegViewController = nextViewController as? IntroRegViewController {
                // Handle IntroRegViewController if needed
            }
            
            setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
            
            
            pageControl.progress = CGFloat(nextIndex)
            
            let nextButtonImageName = "nextBtn\(nextIndex + 1)"
            nextButton.setImage(UIImage(named: nextButtonImageName), for: .normal)
            
        } else {
            print(IntroRegViewController.nameTextField)
            print(IntroRegViewController.ageTextField)
            print(IntroRegViewController.selectedGender)
            guard let username = IntroRegViewController.nameTextField,
                  let ageString = IntroRegViewController.ageTextField,
                  let gender = IntroRegViewController.selectedGender,
                  username != "", ageString != "", gender != "" else {
                isRegDataNotEmpty = false
                return
            }
            
            // Save user information to UserDefaults
            UserSettings.username = username
            UserSettings.age = ageString
            UserSettings.gender = gender
            
            isRegDataNotEmpty = true
            
            if isRegDataNotEmpty == true {
                let startViewController = StartViewController()
                //            startViewController.modalPresentationStyle = .fullScreen
                //            present(startViewController, animated: false)
                navigationController?.pushViewController(startViewController, animated: true)
            } else {
                
            }
            
        }
    }
    
    
    
    
    // MARK: - UIPageViewControllerDataSource
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController), currentIndex > 0 else {
            return nil
        }
        
        let previousIndex = currentIndex - 1
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController), currentIndex < pages.count - 1 else {
            return nil
        }
        
        let nextIndex = currentIndex + 1
        return pages[nextIndex]
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            if let currentViewController = pageViewController.viewControllers?.first as? IntroViewController,
               let currentIndex = pages.firstIndex(of: currentViewController) {
                
                pageControl.progress = CGFloat(currentIndex)
            }
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
