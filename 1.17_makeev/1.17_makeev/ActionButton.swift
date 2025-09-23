//
//  ActionButton.swift
//  1.17_makeev
//
//  Created by Pavel on 22.09.2025.
//

import UIKit

final class ActionButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButton()
        setupTargets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureButton() {
        backgroundColor = .blue
        tintColor = .white
        layer.cornerRadius = 12
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 3
    }
    
    private func setupTargets() {
        addTarget(self, action: #selector(animateTap), for: .touchUpInside)
    }
    
    @objc private func animateTap() {
        
        let originalTransform = transform
        
        UIView.animate(
            withDuration: 0.1,
            delay: 0,
            options: [.curveEaseIn, .allowUserInteraction],
            animations: {
                self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            },
            completion: { _ in
                UIView.animate(
                    withDuration: 0.1,
                    delay: 0,
                    options: [.curveEaseOut, .allowUserInteraction],
                    animations: {
                        self.transform = originalTransform
                    }
                )
            }
        )
    }
}
