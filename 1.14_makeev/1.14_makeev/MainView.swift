//
//  MainView.swift
//  1.14_makeev
//
//  Created by Pavel on 13.09.2025.
//

import UIKit

final class MainView: UIView {
    
    private lazy var mainStackView: StackView = {
        let stackView = StackView(
            config: .init(
                axis: .vertical,
                spacing: 16,
                distribution: .fill,
                alignment: .fill
            )
        )
        return stackView
    }()
    
    private lazy var topHorizontalStack: StackView = {
        let stackView = StackView(
            config: .init(
                axis: .horizontal,
                spacing: 12,
                distribution: .fillEqually,
                alignment: .fill
            )
        )
        return stackView
    }()
    
    private lazy var leftTopVerticalStack: StackView = {
        let stackView = StackView(
            config: .init(
                axis: .vertical,
                spacing: 8,
                distribution: .fillEqually,
                alignment: .fill
            )
        )
        return stackView
    }()
    
    private lazy var firstLeftUpperSmallView: TeaserView = {
        let view = TeaserView(size: .small)
        return view
    }()
    
    private lazy var secondLeftUpperSmallView: TeaserView = {
        let view = TeaserView(size: .small)
        return view
    }()
    
    private lazy var rightUpperMediumView: TeaserView = {
        let view = TeaserView(size: .medium)
        return view
    }()
    
    private lazy var centerLargeView: TeaserView = {
        let view = TeaserView(size: .large)
        return view
    }()
    
    private lazy var bottomHorizontalStack: StackView = {
        let stackView = StackView(
            config: .init(
                axis: .horizontal,
                spacing: 12,
                distribution: .fillEqually,
                alignment: .fill
            )
        )
        return stackView
    }()
    
    private lazy var leftBottomMediumView: TeaserView = {
        let view = TeaserView(size: .medium)
        return view
    }()
    
    private lazy var rightBottomMediumView: TeaserView = {
        let view = TeaserView(size: .medium)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        configureSubviews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubviews() {
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(topHorizontalStack)
        topHorizontalStack.addArrangedSubview(leftTopVerticalStack)
        leftTopVerticalStack.addArrangedSubview(firstLeftUpperSmallView)
        leftTopVerticalStack.addArrangedSubview(secondLeftUpperSmallView)
        topHorizontalStack.addArrangedSubview(rightUpperMediumView)
        mainStackView.addArrangedSubview(centerLargeView)
        mainStackView.addArrangedSubview(bottomHorizontalStack)
        bottomHorizontalStack.addArrangedSubview(leftBottomMediumView)
        bottomHorizontalStack.addArrangedSubview(rightBottomMediumView)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
}
