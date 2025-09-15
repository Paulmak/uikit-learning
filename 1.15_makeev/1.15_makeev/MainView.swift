//
//  MainView.swift
//  1.15_makeev
//
//  Created by Pavel on 15.09.2025.
//

import UIKit

final class MainView: UIView {
    
    private lazy var scrollView: ScrollView = {
        let scrollView = ScrollView()
        return scrollView
    }()
    
    private lazy var contentStackView: StackView = {
        let stackView = StackView(
            config: .init(
                axis: .vertical,
                spacing: 20,
                distribution: .fill,
                alignment: .fill
            )
        )
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        configureSubviews()
        configureConstraints()
        addMultipleContentViews(count: 3)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createContentBlock() -> StackView {
        
        let mainStackView = StackView(
            config: .init(
                axis: .vertical,
                spacing: 20,
                distribution: .fill,
                alignment: .fill
            )
        )
        
        let topHorizontalStack = StackView(
            config: .init(
                axis: .horizontal,
                spacing: 12,
                distribution: .fillEqually,
                alignment: .fill
            )
        )
        
        let leftTopVerticalStack = StackView(
            config: .init(
                axis: .vertical,
                spacing: 8,
                distribution: .fillEqually,
                alignment: .fill
            )
        )
        
        let firstLeftUpperSmallView = TeaserView(size: .small)
        let secondLeftUpperSmallView = TeaserView(size: .small)
        let rightUpperMediumView = TeaserView(size: .medium)
        
        leftTopVerticalStack.addArrangedSubview(firstLeftUpperSmallView)
        leftTopVerticalStack.addArrangedSubview(secondLeftUpperSmallView)
        topHorizontalStack.addArrangedSubview(leftTopVerticalStack)
        topHorizontalStack.addArrangedSubview(rightUpperMediumView)
        
        let centerLargeView = TeaserView(size: .large)
        
        let bottomHorizontalStack = StackView(
            config: .init(
                axis: .horizontal,
                spacing: 12,
                distribution: .fillEqually,
                alignment: .fill
            )
        )
        
        let leftBottomMediumView = TeaserView(size: .medium)
        let rightBottomMediumView = TeaserView(size: .medium)
        
        bottomHorizontalStack.addArrangedSubview(leftBottomMediumView)
        bottomHorizontalStack.addArrangedSubview(rightBottomMediumView)
        
        mainStackView.addArrangedSubview(topHorizontalStack)
        mainStackView.addArrangedSubview(centerLargeView)
        mainStackView.addArrangedSubview(bottomHorizontalStack)
        
        return mainStackView
    }
    
    private func addMultipleContentViews(count: Int) {
        for _ in 0..<count {
            let contentBlock = createContentBlock()
            contentStackView.addArrangedSubview(contentBlock)
        }
    }
    
    private func configureSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(contentStackView)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            contentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            contentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
            contentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32)
        ])
    }
}
