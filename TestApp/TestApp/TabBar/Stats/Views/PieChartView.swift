////
////  PieChartView.swift
////  TestApp
////
////  Created by Artur Avdeev on 06.02.2024.
////
//
//
//import UIKit
//
//class PieChartView: UIView {
//
//    private var slices: [PieSlice] = []
//
//    init(sliceValues: [CGFloat], sliceColors: [UIColor]) {
//        super.init(frame: .zero)
//
//        for (index, value) in sliceValues.enumerated() {
//            slices.append(PieSlice(value: value, color: sliceColors[index]))
//        }
//
//        // Set the background color to clear
//        self.backgroundColor = UIColor.clear
//
//        let angle = -CGFloat.pi / 814.8 // Start from the top
//        self.transform = CGAffineTransform(rotationAngle: angle)
//        
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func draw(_ rect: CGRect) {
//        let center = CGPoint(x: rect.midX, y: rect.midY)
//        let radius = min(rect.width, rect.height) / 2
//        let context = UIGraphicsGetCurrentContext()!
//
//        var cumulativeValue: CGFloat = -90.degreesToRadians // Start from the top
//
//        for slice in slices {
//            let startAngle = cumulativeValue
//            let endAngle = startAngle + slice.value * 360.degreesToRadians
//
//            context.beginPath()
//            context.move(to: center)
//            context.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
//            context.closePath()
//
//            context.setFillColor(slice.color.cgColor)
//            context.fillPath()
//
//            cumulativeValue = endAngle
//        }
//        
//        
//    }
//    
//}
//
//extension CGFloat {
//    var degreesToRadians: CGFloat {
//        return self * .pi / 180
//    }
//}
//
//struct PieSlice {
//    var value: CGFloat
//    var color: UIColor
//}
//
//extension Double {
//    var degreesToRadians: CGFloat {
//        return CGFloat(self) * .pi / 180
//    }
//}
//
import UIKit

class PieChartView: UIView {

    private var slices: [PieSlice] = []

    var sliceValues: [CGFloat] {
        didSet {
            updateSlices()
        }
    }

    init(sliceValues: [CGFloat], sliceColors: [UIColor]) {
        self.sliceValues = sliceValues
        super.init(frame: .zero)

        for (index, value) in sliceValues.enumerated() {
            slices.append(PieSlice(value: value, color: sliceColors[index]))
        }

        // Set the background color to clear
        self.backgroundColor = UIColor.clear

        let angle = -CGFloat.pi / 814.8 // Start from the top
        self.transform = CGAffineTransform(rotationAngle: angle)
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func updateSlices() {
        slices = sliceValues.enumerated().map { (index, value) in
            return PieSlice(value: value, color: slices.indices.contains(index) ? slices[index].color : UIColor.clear)
        }
        setNeedsDisplay()
    }

    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let context = UIGraphicsGetCurrentContext()!

        var cumulativeValue: CGFloat = -90.degreesToRadians // Start from the top

        for slice in slices {
            let startAngle = cumulativeValue
            let endAngle = startAngle + slice.value * 360.degreesToRadians

            context.beginPath()
            context.move(to: center)
            context.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
            context.closePath()

            context.setFillColor(slice.color.cgColor)
            context.fillPath()

            cumulativeValue = endAngle
        }
    }
}

extension CGFloat {
    var degreesToRadians: CGFloat {
        return self * .pi / 180
    }
}

struct PieSlice {
    var value: CGFloat
    var color: UIColor
}

extension Double {
    var degreesToRadians: CGFloat {
        return CGFloat(self) * .pi / 180
    }
}
