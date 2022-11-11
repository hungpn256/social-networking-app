//
//  ActivityIndicatorView.swift
//  chatapp
//
//  Created by HungPN on 11/11/2022.
//

import UIKit

class ActivityIndicatorView: UIView {

    private(set) var isAnimating: Bool = false

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        startAnimating()
    }

    /**
     Start animating.
     */
    func startAnimating() {
        guard !isAnimating else {
            return
        }
        isHidden = false
        isAnimating = true
        layer.speed = 1
        setUpAnimation()
    }

    func setUpAnimation() {
        layer.sublayers = nil

        let duration: CFTimeInterval = 1.0
        let beginTime = CACurrentMediaTime()
        let beginTimes = [0, 0.2, 0.4]

        // Scale animation
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")

        scaleAnimation.duration = duration
        scaleAnimation.fromValue = 0
        scaleAnimation.toValue = 1

        // Opacity animation
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")

        opacityAnimation.duration = duration
        opacityAnimation.keyTimes = [0, 0.05, 1]
        opacityAnimation.values = [0, 1, 0]

        // Animation
        let animation = CAAnimationGroup()

        animation.animations = [scaleAnimation, opacityAnimation]
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false

        // Draw balls
        for i in 0 ..< 3 {
            let circle = setupCALayer(with: bounds.size)
            let frame = CGRect(x: (bounds.size.width - bounds.size.width) / 2,
                               y: (bounds.size.height - bounds.size.height) / 2,
                               width: bounds.size.width,
                               height: bounds.size.height)

            animation.beginTime = beginTime + beginTimes[i]
            circle.frame = frame
            circle.opacity = 0
            circle.add(animation, forKey: "animation")
            layer.addSublayer(circle)
        }
    }

    func setupCALayer(with size: CGSize) -> CALayer {
        let path: UIBezierPath = UIBezierPath()
        let shapeLayer = CAShapeLayer()
        path.addArc(withCenter: CGPoint(x: size.width / 2, y: size.height / 2),
                    radius: 80,
                    startAngle: 0,
                    endAngle: CGFloat(2 * Double.pi),
                    clockwise: false)

        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.backgroundColor = nil
        shapeLayer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        shapeLayer.path = path.cgPath
        return shapeLayer
    }

}
