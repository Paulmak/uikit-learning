//
//  ActionButton.swift
//  1.12_makeev
//
//  Created by Pavel on 07.09.2025.
//

import UIKit

final class ActionButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureButton() {
        setTitle("Start loading", for: .normal)
        backgroundColor = .systemBlue
        tintColor = .white
        layer.cornerRadius = 10
    }
    
    func startAnimation() {
        setTitle("Stop loading", for: .normal)
        
        UIView.animate(
            withDuration: 0.3,
            delay: 0,
            options: .curveEaseInOut
        ) {
            self.transform = .identity
                .scaledBy(x: 0.92, y: 0.92)
        }
    }
    
    func stopAnimation() {
        setTitle("Start loading", for: .normal)
        
        layer.removeAllAnimations()
        
        UIView.animate(withDuration: 0.3) {
            self.transform = .identity
        }
    }
}
