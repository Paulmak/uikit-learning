//
//  TeaserView.swift
//  1.15_makeev
//
//  Created by Pavel on 15.09.2025.
//

import UIKit

final class TeaserView: UIView {
    
    enum TeaserSize {
        case small
        case medium
        case large
    }
    
    private let teaserSize: TeaserSize
    
    override var intrinsicContentSize: CGSize {
        switch teaserSize {
        case .small:
            return CGSize(width: UIView.noIntrinsicMetric, height: 50)
        case .medium:
            return CGSize(width: UIView.noIntrinsicMetric, height: 108)
        case .large:
            return CGSize(width: UIView.noIntrinsicMetric, height: 150)
        }
    }
    
    init(size: TeaserSize) {
        self.teaserSize = size
        super.init(frame: .zero)
        layer.cornerRadius = 16
        layer.backgroundColor = UIColor.systemPink.withAlphaComponent(0.2).cgColor
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
