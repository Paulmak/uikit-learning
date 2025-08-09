//
//  MainView.swift
//  1.3_makeev
//
//  Created by Pavel on 09.08.2025.
//

import UIKit

final class MainView: UIView {
    
    private lazy var topView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var topViewLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello world"
        label.numberOfLines = 4
        label.font = .systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var leftView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var leftViewLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello world"
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var rightView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var rightViewLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello world"
        label.numberOfLines = 1
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bottomLabel: UILabel = {
        let label = UILabel()
        let attributedString = NSMutableAttributedString()
        let helloWorldText = NSAttributedString(string: "Hello world", attributes: [
            .foregroundColor: UIColor.green,
            .font: UIFont.systemFont(ofSize: 18, weight: .bold)
        ])
        let secondHelloWorldText = NSAttributedString(string: "Second hello world", attributes: [
            .strikethroughStyle: 2,
            .foregroundColor: UIColor.blue,
            .font: UIFont.systemFont(ofSize: 24, weight: .bold)
        ])
        attributedString.append(helloWorldText)
        attributedString.append(secondHelloWorldText)
        label.attributedText = attributedString
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemYellow
        configureSubviews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubviews() {
        addSubview(topView)
        topView.addSubview(topViewLabel)
        addSubview(leftView)
        leftView.addSubview(leftViewLabel)
        addSubview(rightView)
        rightView.addSubview(rightViewLabel)
        addSubview(bottomLabel)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            topView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            topView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            topViewLabel.topAnchor.constraint(equalTo: topView.topAnchor, constant: 16),
            topViewLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 16),
            topViewLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -16),
            topViewLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -16),
            
            leftView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 12),
            leftView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            leftView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -16),
            
            leftViewLabel.topAnchor.constraint(equalTo: leftView.topAnchor, constant: 16),
            leftViewLabel.leadingAnchor.constraint(equalTo: leftView.leadingAnchor, constant: 16),
            leftViewLabel.trailingAnchor.constraint(equalTo: leftView.trailingAnchor, constant: -16),
            leftViewLabel.bottomAnchor.constraint(equalTo: leftView.bottomAnchor, constant: -16),
            
            rightView.topAnchor.constraint(equalTo: leftView.bottomAnchor, constant: 12),
            rightView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 16),
            rightView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            rightViewLabel.topAnchor.constraint(equalTo: rightView.topAnchor, constant: 16),
            rightViewLabel.leadingAnchor.constraint(equalTo: rightView.leadingAnchor, constant: 16),
            rightViewLabel.trailingAnchor.constraint(equalTo: rightView.trailingAnchor, constant: -16),
            rightViewLabel.bottomAnchor.constraint(equalTo: rightView.bottomAnchor, constant: -16),
            
            bottomLabel.topAnchor.constraint(equalTo: rightView.bottomAnchor, constant: 12),
            bottomLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            bottomLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            bottomLabel.bottomAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}
