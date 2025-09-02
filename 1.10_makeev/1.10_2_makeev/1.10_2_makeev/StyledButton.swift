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
    }
    
    struct Config {
        var textColor: UIColor?
        var backgroundColor: UIColor?
        var cornerRadius: CGFloat?
        var shadowOpacity: Float?
        var shadowRadius: CGFloat?
        var borderColor: UIColor?
        var borderWidth: CGFloat?
        
        func apply(to button: UIButton) {
            textColor.map { button.setTitleColor($0, for: .normal) }
            backgroundColor.map { button.backgroundColor = $0 }
            cornerRadius.map { button.layer.cornerRadius = $0 }
            shadowOpacity.map { button.layer.shadowOpacity = $0 }
            shadowRadius.map { button.layer.shadowRadius = $0 }
            borderColor.map { button.layer.borderColor = $0.cgColor }
            borderWidth.map { button.layer.borderWidth = $0 }
        }
    }
    
    private var style: Style
    private var title: String
    private var config: Config?
    
    init(style: Style, title: String, config: Config? = nil) {
        self.style = style
        self.title = title
        self.config = config
        
        super.init(frame: .zero)
        self.layer.cornerRadius = 12
        self.setTitle(title, for: .normal)
        setupStyle()
        applyConfigOverrides()
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
        }
    }
    
    private func applyConfigOverrides() {
        config?.apply(to: self)
    }
}
