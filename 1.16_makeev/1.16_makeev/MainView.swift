//
//  MainView.swift
//  1.16_makeev
//
//  Created by Pavel on 16.09.2025.
//

import UIKit

final class MainView: UIView {
    
    private lazy var actionButton: ActionButton = {
        let button = ActionButton()
        button.setTitle("Open detail view", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        configureSubviews()
        configureConstraints()
        setupTargets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var openDetailViewAction: (() -> Void)?
    
    @objc
    private func openDetailView()  {
        openDetailViewAction?()
    }
    
    private func setupTargets() {
        actionButton.addTarget(self, action: #selector(openDetailView), for: .touchUpInside)
    }
    
    private func configureSubviews() {
        addSubview(actionButton)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            actionButton.heightAnchor.constraint(equalToConstant: 60),
            actionButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            actionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            actionButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
}
