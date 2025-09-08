//
//  ProgressAnimationView.swift
//  1.12_makeev
//
//  Created by Pavel on 06.09.2025.
//

import UIKit

final class ProgressAnimationView: UIView {
    
    var isAnimating = false
    
    private lazy var progressLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.lineWidth = 6
        layer.lineCap = .round
        layer.fillColor = nil
        layer.strokeStart = 0
        layer.strokeEnd = 0
        layer.strokeColor = UIColor.systemBlue.cgColor
        return layer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        progressLayer.path = progressLayerPath().cgPath
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func progressLayerPath() -> UIBezierPath {
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = (min(bounds.width, bounds.height) - progressLayer.lineWidth) / 2
        let startAngle = CGFloat(-0.5 * .pi)
        let endAngle = CGFloat(1.5 * .pi)
        return UIBezierPath(arcCenter: center,
                            radius: radius,
                            startAngle: startAngle,
                            endAngle: endAngle,
                            clockwise: true)
    }
    
    private func configureSubviews() {
        layer.addSublayer(progressLayer)
    }
    
    func startAnimation() {
        let quarter: CGFloat = 0.25
        
        let endAnimation = CABasicAnimation(keyPath: "strokeEnd")
        endAnimation.fromValue = 0
        endAnimation.toValue = 1
        endAnimation.duration = 2.0
        endAnimation.repeatCount = .infinity
        endAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        let startAnimation = CABasicAnimation(keyPath: "strokeStart")
        startAnimation.fromValue = -quarter
        startAnimation.toValue = 1 - quarter
        startAnimation.duration = 2.0
        startAnimation.repeatCount = .infinity
        startAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        progressLayer.add(endAnimation, forKey: "strokeEndAnim")
        progressLayer.add(startAnimation, forKey: "strokeStartAnim")
        
        isAnimating = true
    }
    
    func stopAnimation() {
        progressLayer.removeAllAnimations()
        
        isAnimating = false
    }
}
