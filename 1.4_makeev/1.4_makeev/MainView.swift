//
//  MainView.swift
//  1.4_makeev
//
//  Created by Pavel on 11.08.2025.
//

import UIKit

final class MainView: UIView {
    
    private let textView: UITextView
    
    init(frame: CGRect = .zero, textView: UITextView = TextView()) {
        self.textView = textView
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .systemYellow
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        textView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textView)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textView.bottomAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}
