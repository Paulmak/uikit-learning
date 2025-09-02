//
//  StyledButton.swift
//  1.10_makeev
//
//  Created by Pavel on 01.09.2025.
//

import UIKit

final class MainView: UIView {
    
    private lazy var view: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor(.orange).cgColor
        view.layer.cornerRadius = 150
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor(.black).cgColor
        view.layer.shadowRadius = 30
        view.layer.shadowOpacity = 0.7
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        configureSubviews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubviews() {
        addSubview(view)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: centerXAnchor),
            view.centerYAnchor.constraint(equalTo: centerYAnchor),
            view.heightAnchor.constraint(equalToConstant: 300),
            view.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
}
