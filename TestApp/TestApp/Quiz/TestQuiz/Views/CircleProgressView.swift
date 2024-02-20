//
//  CircleProgressView.swift
//  TestApp
//
//  Created by Artur Avdeev on 13.02.2024.
//

import UIKit
//import PlaygroundSupport

public class CircleProgressView: UIView {
    private var radius: CGFloat { (bounds.height - lineWidth) / 2 }
    private let baseLayer = CAShapeLayer()
    private let progressLayer = CAShapeLayer()
    private let progress: CGFloat
    private let lineWidth: CGFloat = 1.0

    required public init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    public init(progress: CGFloat, baseColor: UIColor, progressColor: UIColor) {
        self.progress = progress
        
        for layer in [baseLayer, progressLayer] {
            layer.fillColor = UIColor.clear.cgColor
            layer.lineWidth = lineWidth
            layer.lineCap = .round
        }
        baseLayer.strokeColor = baseColor.cgColor
        baseLayer.strokeEnd = 1.0

        progressLayer.strokeColor = progressColor.cgColor
        progressLayer.strokeEnd = 0.0

        super.init(frame: .zero)

        layer.addSublayer(baseLayer)
        layer.addSublayer(progressLayer)
    }

    public func animateCircle(duration: TimeInterval, delay: TimeInterval) {
        progressLayer.removeAnimation(forKey: "circleAnimation")
        progressLayer.strokeEnd = 0
        addAnimation(duration: duration, delay: delay)
    }

    override open func layoutSubviews() {
        super.layoutSubviews()
        baseLayer.frame = bounds
        progressLayer.frame = bounds

        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let basePath = UIBezierPath(arcCenter: center, radius: radius, startAngle: .initialAngle, endAngle: .endAngle(progress: 1), clockwise: true)
        let progressPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: .initialAngle, endAngle: .endAngle(progress: progress), clockwise: true)
        baseLayer.path = basePath.cgPath
        progressLayer.path = progressPath.cgPath
    }
}

private extension CircleProgressView {
    func addAnimation(duration: TimeInterval, delay: TimeInterval) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.beginTime = CACurrentMediaTime() + delay
        animation.duration = duration
        animation.fromValue = 0
        animation.toValue = 1
        animation.timingFunction = CAMediaTimingFunction(name: .easeIn)
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        progressLayer.add(animation, forKey: "circleAnimation")
    }
}

private extension CGFloat {
    static var initialAngle: CGFloat = -(.pi / 2)

    static func endAngle(progress: CGFloat) -> CGFloat {
        .pi * 2 * progress + .initialAngle
    }
}


//let greaterView = UIView(frame: .init(x: 0, y: 0, width: 200, height: 200))
//let circleView = CircleProgressView(progress: 0.25, baseColor: .lightGray, progressColor: .orange)
//greaterView.addSubview(circleView)
//circleView.bounds = CGRect(x: 0, y: 0, width: 120, height: 120)
//circleView.center = greaterView.center
//PlaygroundPage.current.liveView = greaterView
//PlaygroundPage.current.needsIndefiniteExecution = true
//
//circleView.animateCircle(duration: 0.5, delay: 0.5)
