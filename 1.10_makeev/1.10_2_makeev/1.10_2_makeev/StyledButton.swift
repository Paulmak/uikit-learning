//
//  StyledButton.swift
//  1.10_2_makeev
//
//  Created by Pavel on 01.09.2025.
//

import UIKit

final class StyledButton: UIButton {
    
    enum Style {
        case firstStyle
        case secondStyle
        case custom(config: Config)
    }
    
    struct Config {
        var textColor: UIColor?
        var backgroundColor: UIColor?
        var cornerRadius: CGFloat?
        var shadowOpacity: Float?
        var shadowRadius: CGFloat?
        var borderColor: UIColor?
        var borderWidth: CGFloat?
    }
    
    private let style: Style
    private let title: String
    
    init(style: Style, title: String) {
        self.style = style
        self.title = title
        
        super.init(frame: .zero)
        self.layer.cornerRadius = 12
        self.setTitle(title, for: .normal)
        setupStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStyle() {
        
        switch style {
            
        case .firstStyle:
            self.setTitleColor(.black, for: .normal)
            self.backgroundColor = .blue
            self.layer.shadowOpacity = 0.5
            self.layer.shadowRadius = 10
            
        case .secondStyle:
            let titleColor = UIColor(.red)
            self.setTitleColor(titleColor, for: .normal)
            self.layer.borderColor = titleColor.cgColor
            self.layer.borderWidth = 2
            
        case .custom(let config):
            config.textColor.map { self.setTitleColor($0, for: .normal) }
            config.backgroundColor.map { self.backgroundColor = $0 }
            config.cornerRadius.map { self.layer.cornerRadius = $0 }
            config.shadowOpacity.map { self.layer.shadowOpacity = $0 }
            config.shadowRadius.map { self.layer.shadowRadius = $0 }
            config.borderColor.map { self.layer.borderColor = $0.cgColor }
            config.borderWidth.map { self.layer.borderWidth = $0 }
        }
    }
}
