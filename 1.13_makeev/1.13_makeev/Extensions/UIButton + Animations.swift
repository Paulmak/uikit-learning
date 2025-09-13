//
//  UIButton + Animations.swift
//  1.13_makeev
//
//  Created by Pavel on 11.09.2025.
//

import UIKit

extension UIButton {
    
    func tapWithAnimation() {
        UIView.animate(
            withDuration: 0.1,
            delay: 0,
            options: [.curveEaseInOut],
            animations: {
                self.transform = CGAffineTransform(scaleX: 0.95, y: 0.96)
            },
            completion: { _ in
                UIView.animate(withDuration: 0.1) {
                    self.transform = .identity
                }
            }
        )
    }
}
