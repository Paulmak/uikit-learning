//
//  MainView.swift
//  1.10_2_makeev
//
//  Created by Pavel on 01.09.2025.
//

import UIKit

final class MainView: UIView {
    
    private lazy var firstButton: StyledButton = {
        let button = StyledButton(style: .firstStyle, title: "Hello world!")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var secondButton: StyledButton = {
        let button = StyledButton(
            style: .custom(
                config: StyledButton.Config(
                    textColor: .red,
                    backgroundColor: .brown,
                    cornerRadius: 22,
                    shadowOpacity: 18,
                    shadowRadius: 20,
                    borderColor: .black,
                    borderWidth: 4
                )
            ),
            title: "Second styled button"
        )
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var thirdButton: StyledButton = {
        let button = StyledButton(style: .secondStyle, title: "Hello world!")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var fourthButton: StyledButton = {
        let button = StyledButton(
            style: .custom(
                config: StyledButton.Config(
                    textColor: .blue,
                    cornerRadius: 30,
                    shadowOpacity: 10,
                    shadowRadius: 11,
                    borderColor: .green,
                    borderWidth: 6
                )
            ),
            title: "Fourth styled button"
        )
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        addSubview(firstButton)
        addSubview(secondButton)
        addSubview(thirdButton)
        addSubview(fourthButton)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            firstButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            firstButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            firstButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            firstButton.heightAnchor.constraint(equalToConstant: 60),
            
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 15),
            secondButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            secondButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            secondButton.heightAnchor.constraint(equalToConstant: 60),
            
            thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 15),
            thirdButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            thirdButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            thirdButton.heightAnchor.constraint(equalToConstant: 60),
            
            fourthButton.topAnchor.constraint(equalTo: thirdButton.bottomAnchor, constant: 15),
            fourthButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            fourthButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            fourthButton.heightAnchor.constraint(equalToConstant: 60),
            
        ])
    }
}
