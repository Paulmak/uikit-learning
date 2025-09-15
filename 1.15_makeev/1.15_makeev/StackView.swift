//
//  StackView.swift
//  1.15_makeev
//
//  Created by Pavel on 15.09.2025.
//

import UIKit

final class StackView: UIStackView {
    
    private let stackViewConfig: StackViewConfig
    
    struct StackViewConfig {
        var axis: NSLayoutConstraint.Axis
        var spacing: CGFloat
        var distribution: UIStackView.Distribution
        var alignment: UIStackView.Alignment
    }
    
    init(config: StackViewConfig) {
        self.stackViewConfig = config
        super.init(frame: .zero)
        configureStackView()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureStackView() {
        self.axis = stackViewConfig.axis
        self.spacing = stackViewConfig.spacing
        self.distribution = stackViewConfig.distribution
        self.alignment = stackViewConfig.alignment
    }
}
