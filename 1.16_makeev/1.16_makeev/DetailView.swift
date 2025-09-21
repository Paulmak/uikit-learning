//
//  DetailView.swift
//  1.16_makeev
//
//  Created by Pavel on 16.09.2025.
//

import UIKit

final class DetailView: UIView {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var closeButton: ActionButton = {
        let button = ActionButton()
        button.setTitle("Close", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var changeBackgroundColorButton: ActionButton  = {
        let button = ActionButton()
        button.setTitle("Set a random color", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        configureSubviews()
        configureConstraints()
        setupTargets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var closeDetailViewAction: (() -> Void)?
    var changeColorForMainViewAction: (() -> Void)?
    
    @objc
    private func closeDetailView()  {
        closeDetailViewAction?()
    }
    
    @objc
    func changeBackgroundColorForMainView()  {
        changeColorForMainViewAction?()
    }
    
    private func setupTargets() {
        closeButton.addTarget(self, action: #selector(closeDetailView), for: .touchUpInside)
        changeBackgroundColorButton.addTarget(self, action: #selector(changeBackgroundColorForMainView), for: .touchUpInside)
    }
    
    private func configureSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(closeButton)
        stackView.addArrangedSubview(changeBackgroundColorButton)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 60),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}
