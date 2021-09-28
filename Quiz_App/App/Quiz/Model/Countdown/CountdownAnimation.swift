import Foundation
import UIKit

public class CountdownAnimation {

    public static func startAnimation (countdownView: UIView, duration: Double, fromValue: Double = 1){
        let shapeLayer = CAShapeLayer()

        let centerPoint = CGPoint(x: countdownView.bounds.midX, y: countdownView.bounds.midY)

        let circularPath = UIBezierPath(arcCenter: centerPoint, radius: 20, startAngle: (2 * CGFloat.pi - CGFloat.pi / 2) , endAngle: -CGFloat.pi/2, clockwise: false)

        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 3
        shapeLayer.strokeEnd = 0

        countdownView.layer.addSublayer(shapeLayer)

        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.fromValue = fromValue
        basicAnimation.toValue = 0
        basicAnimation.duration = duration
        shapeLayer.add(basicAnimation, forKey: "animationKey")
    }
}
