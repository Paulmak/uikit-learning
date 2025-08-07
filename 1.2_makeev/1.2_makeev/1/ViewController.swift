//
//  ViewController.swift
//  1.2_makeev
//
//  Created by Pavel on 05.08.2025.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        configureSubviews()
        configureConstraints()
    }
    
    private lazy var upperView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var middleLeadingView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var middleTrailingView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var bottomLeadingView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var bottomCenterView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var bottomTrailingView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func configureSubviews() {
        view.addSubview(upperView)
        view.addSubview(middleLeadingView)
        view.addSubview(middleTrailingView)
        view.addSubview(bottomLeadingView)
        view.addSubview(bottomCenterView)
        view.addSubview(bottomTrailingView)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            upperView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            upperView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            upperView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            upperView.heightAnchor.constraint(equalToConstant: 40),
            
            middleLeadingView.topAnchor.constraint(equalTo: upperView.bottomAnchor, constant: 12),
            middleLeadingView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            middleLeadingView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -6),
            middleLeadingView.heightAnchor.constraint(equalToConstant: 90),
            
            middleTrailingView.topAnchor.constraint(equalTo: upperView.bottomAnchor, constant: 12),
            middleTrailingView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 6),
            middleTrailingView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            middleTrailingView.heightAnchor.constraint(equalToConstant: 90),
            
            bottomCenterView.topAnchor.constraint(equalTo: middleLeadingView.bottomAnchor, constant: 24),
            bottomCenterView.heightAnchor.constraint(equalToConstant: 120),
            bottomCenterView.widthAnchor.constraint(equalToConstant: 120),
            bottomCenterView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            bottomLeadingView.topAnchor.constraint(equalTo: middleLeadingView.bottomAnchor, constant: 24),
            bottomLeadingView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            bottomLeadingView.trailingAnchor.constraint(equalTo: bottomCenterView.leadingAnchor, constant: -12),
            bottomLeadingView.heightAnchor.constraint(equalTo: bottomCenterView.heightAnchor),
            
            bottomTrailingView.topAnchor.constraint(equalTo: middleLeadingView.bottomAnchor, constant: 24),
            bottomTrailingView.leadingAnchor.constraint(equalTo: bottomCenterView.trailingAnchor, constant: 12),
            bottomTrailingView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            bottomTrailingView.heightAnchor.constraint(equalTo: bottomCenterView.heightAnchor)
        ])
    }
}
