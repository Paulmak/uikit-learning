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
        return UIBezierPath(
            arcCenter: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: true
        )
    }
    
    private func configureSubviews() {
        layer.addSublayer(progressLayer)
    }
    
    func startAnimation() {
        
        guard !isAnimating else { return }
        
        let duration: CFTimeInterval = 2
        
        let startAnim = CAKeyframeAnimation(keyPath: "strokeStart")
        startAnim.values = [0, 0, 0, 0.25, 0.5, 0.75, 1]
        startAnim.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 0.9, 1]
        startAnim.duration = duration
        startAnim.repeatCount = .infinity
        startAnim.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        let endAnim = CAKeyframeAnimation(keyPath: "strokeEnd")
        endAnim.values = [0, 0.25, 0.5, 0.75, 1, 1.25, 1.25]
        endAnim.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 0.9, 1]
        endAnim.duration = duration
        endAnim.repeatCount = .infinity
        endAnim.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        progressLayer.add(startAnim, forKey: "strokeStart")
        progressLayer.add(endAnim, forKey: "strokeEnd")
        
        isAnimating = true
    }
    
    func stopAnimation() {
        progressLayer.removeAllAnimations()
        
        isAnimating = false
    }
}
