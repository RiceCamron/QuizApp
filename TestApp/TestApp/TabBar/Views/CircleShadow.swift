//
//  CircleShadow.swift
//  TestApp
//
//  Created by Artur Avdeev on 05.02.2024.
//

import UIKit

final class CircleShadow: UIView {
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(
            arcCenter: CGPoint(x: rect.width / 2.0, y: rect.height / 2.0), radius: rect.width / 2.0, startAngle: 0.0, endAngle: .pi * 2, clockwise: true
        )
        drawCircle(path)
        drawFirstShadow(path)
        drawSecondShadow(path)
        drawThirdShadow(path)
        drawFourShadow(path)
    }
    
}

private extension CircleShadow {
    
    func drawCircle(_ path: UIBezierPath) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.white.cgColor
        layer.addSublayer(shapeLayer)
    }
    
    func drawFirstShadow(_ path: UIBezierPath) {
        
        
            let shadowLayer = CALayer()
            shadowLayer.frame = path.bounds
            shadowLayer.shadowOffset = .zero
            shadowLayer.shadowOpacity = 1.0
            shadowLayer.shadowColor = UIColor(hexString: "#FF7A00").cgColor
            shadowLayer.shadowRadius = 34.5
            shadowLayer.shadowPath = path.cgPath
            layer.insertSublayer(shadowLayer, at: 0)
    }
    
    func drawSecondShadow(_ path: UIBezierPath) {
        
            let shadowLayer = CALayer()
            shadowLayer.frame = path.bounds
            shadowLayer.shadowOffset = .zero
            shadowLayer.shadowOpacity = 1.0
            shadowLayer.shadowColor = UIColor(hexString: "#FF9900").cgColor
            shadowLayer.shadowRadius = 20.5
            shadowLayer.shadowPath = path.cgPath
            layer.insertSublayer(shadowLayer, at: 0)
    }
    
    func drawThirdShadow(_ path: UIBezierPath) {
        let shadowLayer = CALayer()
        shadowLayer.frame = path.bounds
        shadowLayer.shadowOffset = .zero
        shadowLayer.shadowOpacity = 1.0
        shadowLayer.shadowColor = UIColor(hexString: "#FFD600").cgColor
        shadowLayer.shadowRadius = 14.0
        shadowLayer.shadowPath = path.cgPath
        layer.insertSublayer(shadowLayer, at: 0)
        
    }
    
    func drawFourShadow(_ path: UIBezierPath) {
        let shadowLayer = CALayer()
        shadowLayer.frame = path.bounds
        shadowLayer.shadowOffset = .zero
        shadowLayer.shadowOpacity = 1.0
        shadowLayer.shadowColor = UIColor.white.cgColor
        shadowLayer.shadowRadius = 6.0
        shadowLayer.shadowPath = path.cgPath
        layer.insertSublayer(shadowLayer, at: 0)
    }
}
