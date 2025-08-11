//
//  UITextView.swift
//  1.4_makeev
//
//  Created by Pavel on 11.08.2025.
//

import UIKit

final class TextView: UITextView {
    
    private let maxHeight: CGFloat = 120
    
    override var contentSize: CGSize {
        didSet {
            isScrollEnabled = contentSize.height > maxHeight
        }
    }
    
    init() {
        super.init(frame: .zero, textContainer: nil)
        configureTextView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTextView() {
        textContainerInset = .init(top: 16, left: 16, bottom: 16, right: 16)
        font = .systemFont(ofSize: 16, weight: .bold)
        isScrollEnabled = false
    }
}
