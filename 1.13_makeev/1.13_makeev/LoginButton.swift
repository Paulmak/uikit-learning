//
//  LoginButton.swift
//  1.13_makeev
//
//  Created by Pavel on 10.09.2025.
//

import UIKit

final class LoginButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        .init(width: frame.width, height: 55)
    }
    
    private func configureButton() {
        backgroundColor = .systemBlue
        setTitle("Отправить", for: .normal)
        layer.cornerRadius = 12
        alpha = 0.5
    }
}
