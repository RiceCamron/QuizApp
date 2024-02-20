////
////  TimerView.swift
////  TestApp
////
////  Created by Artur Avdeev on 12.02.2024.
////
//
//import UIKit
//
//class TimerView: UIView {
//    
//    let timerBlock: UIImageView = {
//        let image = UIImage(named: "timerBlock")
//        let view = UIImageView()
//        view.image = image
//        return view
//    }()
//    
//    var timer: Int = 0
//    
//    var countdownTimer: Timer?
//    
//    let timerLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont(name: "Inter-Regular", size: 26)
//        label.textColor = UIColor.white
//        label.textAlignment = .center
//        return label
//    }()
//    
//    let circleLayer = CAShapeLayer()
//
//    
//    init(timer: Int) {
//        super.init(frame: .zero)
//        self.timer = timer
//        
//        configureAppearance()
//        setupViews()
//        constrainViews()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    deinit {
//        // Invalidate the timer when TimerView is deallocated
//        countdownTimer?.invalidate()
//    }
//    
//}
//
//extension TimerView{
//    func configureAppearance() {
//        circleLayer.strokeColor = UIColor.white.cgColor
//        circleLayer.lineWidth = 5.0
//        
//        timerBlock.layer.borderWidth = 1.0
//        timerBlock.layer.cornerRadius = 32.0
//        timerBlock.layer.borderColor = UIColor.white.cgColor
//        
//        timerLabel.text = String(timer)
//        startTimer()
//    }
//    
//    func setupViews() {
//        setupView(timerBlock)
//        setupView(timerLabel)
//        layer.addSublayer(circleLayer)
//    }
//    
//    func constrainViews() {
//        NSLayoutConstraint.activate([
//            
//            timerBlock.widthAnchor.constraint(equalToConstant: 65),
//            timerBlock.heightAnchor.constraint(equalToConstant: 65),
//            
//            timerLabel.centerYAnchor.constraint(equalTo: timerBlock.centerYAnchor),
//            timerLabel.centerXAnchor.constraint(equalTo: timerBlock.centerXAnchor),
//                 
//        ])
//    }
//
//
//
//    func setupView(_ view: UIView) {
//        view.translatesAutoresizingMaskIntoConstraints = false
//        self.addSubview(view)
//    }
//    
//    func startTimer() {
//        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
//    }
//
//    @objc func updateTimer() {
//        if timer > 0 {
//            print(timer)
//            timer -= 1
//            timerLabel.text = "\(timer)"
//        } else if timer == 0 {
//            countdownTimer?.invalidate()
//            
//            
//            var responder: UIResponder? = self
//            while let nextResponder = responder?.next {
//                if let viewController = nextResponder as? TestQuizVC {
////                    viewController.answerButtonTapped()
//                    viewController.showFinishVC(timer: countdownTimer!)
//                    break
//                }
//                responder = nextResponder
//            }
//        }
//    }
//
//    
//}
import UIKit
//import PlaygroundSupport

class TimerView: UIView {

    let timerBlock: UIImageView = {
        let image = UIImage(named: "timerBlock")
        let view = UIImageView()
        view.image = image
        return view
    }()

    var timer: Int = 0
    var countdownTimer: Timer?
    let timerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Regular", size: 26)
        label.textColor = UIColor.white
        label.textAlignment = .center
        return label
    }()

    public var circleProgressView: CircleProgressView = {
        let view = CircleProgressView(progress: 1.0, baseColor: .clear, progressColor: .white)
        return view
    }()

    init(timer: Int) {
        super.init(frame: .zero)
        self.timer = timer

        configureAppearance()
        setupViews()
        constrainViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        // Invalidate the timer when TimerView is deallocated
        countdownTimer?.invalidate()
    }
}

extension TimerView {
    func configureAppearance() {
        circleProgressView.animateCircle(duration: TimeInterval(timer), delay: 0)

//        timerBlock.layer.borderWidth = 1.0
//        timerBlock.layer.cornerRadius = 32.0
//        timerBlock.layer.borderColor = UIColor.white.cgColor

        timerLabel.text = String(timer)
        startTimer()
    }

    func setupViews() {
        setupView(timerBlock)
        setupView(timerLabel)
        setupView(circleProgressView)
    }

    func constrainViews() {
        NSLayoutConstraint.activate([
            timerBlock.widthAnchor.constraint(equalToConstant: 65),
            timerBlock.heightAnchor.constraint(equalToConstant: 65),
            timerLabel.centerYAnchor.constraint(equalTo: timerBlock.centerYAnchor),
            timerLabel.centerXAnchor.constraint(equalTo: timerBlock.centerXAnchor),
//            circleProgressView.topAnchor.constraint(equalTo: timerBlock.topAnchor),
//            circleProgressView.leadingAnchor.constraint(equalTo: timerBlock.leadingAnchor),
//            circleProgressView.trailingAnchor.constraint(equalTo: timerBlock.trailingAnchor),
//            circleProgressView.bottomAnchor.constraint(equalTo: timerBlock.bottomAnchor)
            circleProgressView.centerXAnchor.constraint(equalTo: timerBlock.centerXAnchor),
            circleProgressView.centerYAnchor.constraint(equalTo: timerBlock.centerYAnchor),
            circleProgressView.widthAnchor.constraint(equalToConstant: 66),
            circleProgressView.heightAnchor.constraint(equalToConstant: 66),
        ])
    }

    func setupView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
    }

    func startTimer() {
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

    @objc func updateTimer() {
        if timer > 0 {
            print(timer)
            timer -= 1
            timerLabel.text = "\(timer)"
        } else if timer == 0 {
            countdownTimer?.invalidate()

            var responder: UIResponder? = self
            while let nextResponder = responder?.next {
                if let viewController = nextResponder as? TestQuizVC {
                    viewController.showFinishVC(timer: countdownTimer!, circleProgressView: circleProgressView)
                    break
                }
                responder = nextResponder
            }
        }
    }
}

//let greaterView = UIView(frame: .init(x: 0, y: 0, width: 200, height: 200))
//let timerView = TimerView(timer: 10)
//greaterView.addSubview(timerView)
//timerView.bounds = CGRect(x: 0, y: 0, width: 120, height: 120)
//timerView.center = greaterView.center
//PlaygroundPage.current.liveView = greaterView
//PlaygroundPage.current.needsIndefiniteExecution = true
