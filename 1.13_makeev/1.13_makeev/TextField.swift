//
//  TextField.swift
//  1.13_makeev
//
//  Created by Pavel on 10.09.2025.
//

import UIKit

final class TextField: UITextField {
    
    private static let inset: CGFloat = 12
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTextField()
        addTargets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        .init(width: frame.width, height: 55)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        .init(x: Self.inset, y: 0, width: bounds.width - Self.inset * 2, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        .init(x: Self.inset, y: 0, width: bounds.width - Self.inset * 2, height: bounds.height)
    }
    
    private func configureTextField() {
        backgroundColor = .lightGray.withAlphaComponent(0.2)
        layer.cornerRadius = 12
        
        font = .systemFont(ofSize: 16, weight: .regular)
        textColor = .black
        attributedPlaceholder = NSAttributedString(string: "", attributes: [
            .font: UIFont.systemFont(ofSize: 16, weight: .regular),
            .strokeColor: UIColor.darkGray
        ])
    }
    
    private func addTargets() {
        addTarget(self, action: #selector(editingDidBegin), for: .editingDidBegin)
        addTarget(self, action: #selector(editingDidEnd), for: .editingDidEnd)
    }
    
    @objc
    private func editingDidBegin() {
        UIView.animate(withDuration: 0.2) {
            self.layer.borderColor = UIColor.systemBlue.withAlphaComponent(0.5).cgColor
            self.layer.borderWidth = 2
        }
    }
    
    @objc
    private func editingDidEnd() {
        self.layer.borderWidth = 0
    }
}
